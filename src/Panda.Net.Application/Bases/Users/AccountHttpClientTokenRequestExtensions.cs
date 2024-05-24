using IdentityModel.Client;
using System;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

namespace Panda.Net.Bases.Users;

public static class AccountHttpClientTokenRequestExtensions
{
    public static async Task<TokenResponse> RequestPasswordTokenAsync(
        this HttpMessageInvoker client,
        PasswordTokenRequest request,
        CancellationToken cancellationToken = default)
    {
        var request1 = request.Clone();
        request1.Parameters.AddRequired("username", request.UserName);
        request1.Parameters.AddRequired("password", request.Password, allowEmptyValue: true);
        request1.Parameters.AddOptional("scope", request.Scope);
        request1.Parameters.AddRequired("grant_type", request.GrantType);
        foreach (var str in request.Resource)
        {
            request1.Parameters.AddRequired("resource", str, true);
        }

        return await client.RequestTokenAsync(request1, cancellationToken);
    }

    internal static async Task<TokenResponse> RequestTokenAsync(
        this HttpMessageInvoker client,
        ProtocolRequest request,
        CancellationToken cancellationToken = default)
    {
        request.Prepare();
        request.Method = HttpMethod.Post;
        HttpResponseMessage httpResponse;
        try
        {
            httpResponse = await client.SendAsync(request, cancellationToken);
        }
        catch (OperationCanceledException)
        {
            throw;
        }
        catch (Exception ex)
        {
            return ProtocolResponse.FromException<TokenResponse>(ex);
        }
        return await ProtocolResponse.FromHttpResponseAsync<TokenResponse>(httpResponse);
    }
}