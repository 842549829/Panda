using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Panda.Application;
using Panda.DataDictionary.Application.Contracts;
using Panda.DataDictionary.Domain;
using Panda.Net;
using Volo.Abp.AutoMapper;
using Volo.Abp.FluentValidation;
using Volo.Abp.Http.Client;
using Volo.Abp.Modularity;

namespace Panda.DataDictionary.Application;

[DependsOn(
    typeof(DictionaryDomainModule),
    typeof(DictionaryApplicationContractsModule),
    typeof(PandaApplicationModule),
    typeof(AbpAutoMapperModule),
    typeof(AbpFluentValidationModule),
    typeof(NetHttpApiClientModule)
)]
public class DictionaryApplicationModule : AbpModule
{
    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        Configure<AbpAutoMapperOptions>(options =>
        {
            options.AddMaps<DictionaryApplicationModule>();
        });

        // 客户端代理设置请求头
        Configure<AbpHttpClientBuilderOptions>(options =>
        {
            options.ProxyClientActions.Add((_, provider, client) =>
            {
                var httpContextAccessor = provider.GetRequiredService<IHttpContextAccessor>();
                var httpContext = httpContextAccessor.HttpContext;
                if (httpContext == null)
                {
                    return;
                }
                var token = httpContext.GetTokenAsync("access_token").Result ?? httpContext.Request.Headers["Authorization"];
                if (token != null)
                {
                    client.DefaultRequestHeaders.Add("Bearer Authorization", token);
                }
            });
        });
    }
}