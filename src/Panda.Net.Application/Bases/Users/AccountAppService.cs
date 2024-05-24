using System;
using IdentityModel.Client;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Panda.Net.Bases.Users.Dtos;
using Panda.Net.Options;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using Volo.Abp;

namespace Panda.Net.Bases.Users;

public class AccountAppService : NetAppService, IAccountAppService
{
    private readonly HttpClient _client;
    private readonly AuthServerOptions _authServerOption;

    public AccountAppService(IOptions<AuthServerOptions> authServerOption,
        IHttpClientFactory httpClientFactory)
    {
        _client = httpClientFactory.CreateClient();
        _authServerOption = authServerOption.Value;
    }

    [RemoteService(IsEnabled = false)]
    public async Task<LoginResultDto> LoginAsync(LoginInputDto input)
    {
        var disco = await GetDiscoveryDocumentAsync();
        var passwordTokenRequest = new PasswordTokenRequest
        {
            Address = disco.TokenEndpoint,
            ClientId = _authServerOption.ClientId,
            ClientSecret = _authServerOption.ClientSecret,
            UserName = input.UserName,
            Password = input.Password,
            Scope = _authServerOption.Scope,
            GrantType = _authServerOption.GrantType
        };
        if (input.TenantId.HasValue && input.TenantId.Value != Guid.Empty)
        {
            passwordTokenRequest.Headers.Add("__tenant", input.TenantId.Value.ToString());
        }
        else
        {
            //passwordTokenRequest.Headers.Add("__tenant", "null");
        }

        var tokenResponse = await _client.RequestPasswordTokenAsync(passwordTokenRequest);
        TokenResponseHandle(tokenResponse);
        var token = CreateLoginResult(tokenResponse);
        return token;
    }

    [RemoteService(IsEnabled = false)]
    public async Task<LoginResultDto> RefreshAsync(RefreshTokenInputDto input)
    {
        var disco = await GetDiscoveryDocumentAsync();
        var tokenResponse = await _client.RequestRefreshTokenAsync(new RefreshTokenRequest
        {
            Address = disco.TokenEndpoint,
            ClientId = _authServerOption.ClientId,
            ClientSecret = _authServerOption.ClientSecret,
            RefreshToken = input.RefreshToken
        });
        TokenResponseHandle(tokenResponse);
        var token = CreateLoginResult(tokenResponse);
        return token;
    }

    private async Task<DiscoveryDocumentResponse> GetDiscoveryDocumentAsync()
    {
        var discoveryDocumentRequest = new DiscoveryDocumentRequest
        {
            Address = _authServerOption.Authority,
            Policy =
            {
                RequireHttps = _authServerOption.RequireHttpsMetadata
            }
        };
        var disco = await _client.GetDiscoveryDocumentAsync(discoveryDocumentRequest);
        if (disco.IsError)
        {
            DiscoveryDocumentResponseHandle(disco);
        }

        return disco;
    }

    private static LoginResultDto CreateLoginResult(TokenResponse tokenResponse)
    {
        var token = new LoginResultDto
        {
            AccessToken = tokenResponse.AccessToken,
            RefreshToken = tokenResponse.RefreshToken!,
            TokenType = tokenResponse.TokenType!,
            ExpiresIn = tokenResponse.ExpiresIn
        };
        return token;
    }

    private void DiscoveryDocumentResponseHandle(ProtocolResponse disco)
    {
        var msg = disco.Error != null
            ? $"用户连接到注册中心出错，详情{disco.Error}"
            : $"用户连接到注册中心出错，错误码{disco.HttpStatusCode}，详情{disco.Json}";
        Logger.LogError(msg);
        if (disco.Exception != null)
        {
            Logger.LogError(disco.Exception, "连接到注册中心出错");
        }

        throw new UserFriendlyException(message: "连接到注册中心出错");
    }

    private void TokenResponseHandle(TokenResponse tokenResponse)
    {
        if (!tokenResponse.IsError)
        {
            return;
        }

        if (tokenResponse.Exception != null)
        {
            Logger.LogError(tokenResponse.Exception, "登录到注册中心出错");
        }

        if (tokenResponse.HttpResponse.StatusCode == HttpStatusCode.InternalServerError ||
            tokenResponse.Error == "Internal Server Error")
        {
            throw new UserFriendlyException("认证中心服务器异常");
        }

        switch (tokenResponse.Error)
        {
            case "invalid_grant":
                throw new UserFriendlyException("登录帐号或密码错误");
                //throw new UserFriendlyException(tokenResponse.ErrorDescription ?? "登录帐号或密码错误");
            case "invalid_request":
                throw new UserFriendlyException("登录请求异常");
                //throw new UserFriendlyException(tokenResponse.ErrorDescription ?? "登录请求异常");
            default:
                Logger.LogError("登录获取token出错，错误信息{@tokenResponse}", tokenResponse);
                throw new UserFriendlyException("登录系统错误");
        }
    }
}