using System.Net.Http;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Http;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Http.Client.Proxying;

namespace Panda.Net;

[Dependency(ReplaceServices = true)]
public class NetProxyHttpClientFactory : IProxyHttpClientFactory, ITransientDependency
{
    private readonly IHttpClientFactory _httpClientFactory;
    private readonly IHttpContextAccessor _httpContextAccessor;

    public NetProxyHttpClientFactory(IHttpClientFactory httpClientFactory, IHttpContextAccessor httpContextAccessor)
    {
        _httpClientFactory = httpClientFactory;
        _httpContextAccessor = httpContextAccessor;
    }

    public HttpClient Create()
    {
        var http = _httpClientFactory.CreateClient();
        SetHeader(http);
        return http;
    }

    public HttpClient Create(string name)
    {
        var http = _httpClientFactory.CreateClient(name);
        SetHeader(http);
        return http;
    }

    private void SetHeader(HttpClient httpClient)
    {
        if (_httpContextAccessor.HttpContext == null)
        {
            return;
        }

        var token = _httpContextAccessor.HttpContext.GetTokenAsync("access_token").Result ?? _httpContextAccessor.HttpContext.Request.Headers["Authorization"];
        if (token != null)
        {
            httpClient.DefaultRequestHeaders.Add($"{JwtBearerDefaults.AuthenticationScheme} Authorization", token);
        }
    }
}