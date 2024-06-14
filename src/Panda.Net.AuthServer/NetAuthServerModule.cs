using System;
using System.IO;
using System.Linq;
using Localization.Resources.AbpUi;
using Medallion.Threading;
using Medallion.Threading.Redis;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Panda.Net.EntityFrameworkCore;
using Panda.Net.ExtensionGrantTypes;
using Panda.Net.Localization;
using Panda.Net.MultiTenancy;
using StackExchange.Redis;
using Volo.Abp;
using Volo.Abp.Account;
using Volo.Abp.Account.Web;
using Volo.Abp.AspNetCore.Mvc.UI;
using Volo.Abp.AspNetCore.Mvc.UI.Bootstrap;
using Volo.Abp.AspNetCore.Mvc.UI.Bundling;
using Volo.Abp.AspNetCore.Mvc.UI.Theme.LeptonXLite;
using Volo.Abp.AspNetCore.Mvc.UI.Theme.LeptonXLite.Bundling;
using Volo.Abp.AspNetCore.Mvc.UI.Theme.Shared;
using Volo.Abp.AspNetCore.Serilog;
using Volo.Abp.Auditing;
using Volo.Abp.Autofac;
using Volo.Abp.BackgroundJobs;
using Volo.Abp.Caching;
using Volo.Abp.Caching.StackExchangeRedis;
using Volo.Abp.DistributedLocking;
using Volo.Abp.Localization;
using Volo.Abp.Modularity;
using Volo.Abp.UI.Navigation.Urls;
using Volo.Abp.UI;
using Volo.Abp.VirtualFileSystem;
using Volo.Abp.OpenIddict.ExtensionGrantTypes;
using Microsoft.OpenApi.Models;
using System.Collections.Generic;
using Microsoft.Extensions.Configuration;
using Volo.Abp.Swashbuckle;
using Volo.Abp.AspNetCore.MultiTenancy;
using Volo.Abp.MultiTenancy;
using Microsoft.AspNetCore.Mvc.Razor;
using Volo.Abp.OpenIddict;
using OpenIddict.Server.AspNetCore;

namespace Panda.Net;

[DependsOn(
    typeof(AbpAutofacModule),
    typeof(AbpCachingStackExchangeRedisModule),
    typeof(AbpDistributedLockingModule),
    typeof(AbpAccountWebOpenIddictModule),
    typeof(AbpAccountApplicationModule),
    typeof(AbpAccountHttpApiModule),
    typeof(AbpAspNetCoreMvcUiLeptonXLiteThemeModule),
    typeof(NetEntityFrameworkCoreModule),
    typeof(AbpAspNetCoreSerilogModule),
    typeof(AbpSwashbuckleModule)
    )]
public class NetAuthServerModule : AbpModule
{
    public override void PreConfigureServices(ServiceConfigurationContext context)
    {
        PreConfigure<OpenIddictBuilder>(builder =>
        {
            builder.AddValidation(options =>
            {
                options.AddAudiences("Net");
                options.UseLocalServer();
                options.UseAspNetCore();
            });

            //builder.AddServer(options =>
            //{
            //    options.UseAspNetCore().DisableTransportSecurityRequirement();
            //});
        });

        // 禁用安全传输https
        Configure<OpenIddictServerAspNetCoreOptions>(options =>
        {
            options.DisableTransportSecurityRequirement = true;
        });

        PreConfigure<OpenIddictServerBuilder>(builder =>
        {
            builder.Configure(options =>
            {
                // 注册新的GrantTypes模式
                options.GrantTypes.Add("net");

            });
        });
    }

    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        var hostingEnvironment = context.Services.GetHostingEnvironment();
        var configuration = context.Services.GetConfiguration();

        // 注入统一添加Claims
        Configure<AbpOpenIddictClaimsPrincipalOptions>(options =>
        {
            options.ClaimsPrincipalHandlers.Remove<AbpDefaultOpenIddictClaimsPrincipalHandler>();
            options.ClaimsPrincipalHandlers.Add<NetDefaultOpenIddictClaimsPrincipalHandler>();

            // 必须放在集合第一个位置执行因为是全局注册 下面的NetDefaultOpenIddictClaimsPrincipalHandler 才能注册token成功
            options.ClaimsPrincipalHandlers.Insert(0, typeof(UnifiedClaimsPrincipalExtension));
        });


        // 注入设备代码认证地址
        //Configure<RazorViewEngineOptions>(options =>
        //{
        //    options.ViewLocationFormats.Add("/Views/{1}/{0}.cshtml");
        //});

        // 注册新的GrantTypes模式实现方案
        context.Services.AddScoped<NetTokenExtensionGrant>();
        Configure<AbpOpenIddictExtensionGrantsOptions>(options =>
        {
            var netTokenExtensionGrant = context.Services.GetRequiredService<NetTokenExtensionGrant>();
            options.Grants.Add("net", netTokenExtensionGrant);
            //options.Grants.Add("net", new NetTokenExtensionGrant());
        });

        Configure<AbpLocalizationOptions>(options =>
        {
            options.Resources
                .Get<NetResource>()
                .AddBaseTypes(
                    typeof(AbpUiResource)
                );
        });

        Configure<AbpBundlingOptions>(options =>
        {
            options.StyleBundles.Configure(
                LeptonXLiteThemeBundles.Styles.Global,
                bundle =>
                {
                    bundle.AddFiles("/global-styles.css");
                }
            );
        });

        Configure<AbpAuditingOptions>(options =>
        {
            //options.IsEnabledForGetRequests = true;
            options.ApplicationName = "AuthServer";
        });

        if (hostingEnvironment.IsDevelopment())
        {
            Configure<AbpVirtualFileSystemOptions>(options =>
            {
                options.FileSets.ReplaceEmbeddedByPhysical<NetDomainSharedModule>(Path.Combine(hostingEnvironment.ContentRootPath, $"..{Path.DirectorySeparatorChar}Panda.Net.Domain.Shared"));
                options.FileSets.ReplaceEmbeddedByPhysical<NetDomainModule>(Path.Combine(hostingEnvironment.ContentRootPath, $"..{Path.DirectorySeparatorChar}Panda.Net.Domain"));
            });
        }

        Configure<AppUrlOptions>(options =>
        {
            options.Applications["MVC"].RootUrl = configuration["App:SelfUrl"];
            options.RedirectAllowedUrls.AddRange(configuration["App:RedirectAllowedUrls"]?.Split(',') ?? Array.Empty<string>());

            options.Applications["Angular"].RootUrl = configuration["App:ClientUrl"];
            options.Applications["Angular"].Urls[AccountUrlNames.PasswordReset] = "account/reset-password";
        });

        Configure<AbpBackgroundJobOptions>(options =>
        {
            options.IsJobExecutionEnabled = false;
        });

        Configure<AbpDistributedCacheOptions>(options =>
        {
            options.KeyPrefix = "Net:";
        });

        var dataProtectionBuilder = context.Services.AddDataProtection().SetApplicationName("Net");
        if (!hostingEnvironment.IsDevelopment())
        {
            var redis = ConnectionMultiplexer.Connect(configuration["Redis:Configuration"]!);
            dataProtectionBuilder.PersistKeysToStackExchangeRedis(redis, "Net-Protection-Keys");
        }

        context.Services.AddSingleton<IDistributedLockProvider>(sp =>
        {
            var connection = ConnectionMultiplexer.Connect(configuration["Redis:Configuration"]!);
            return new RedisDistributedSynchronizationProvider(connection.GetDatabase());
        });

        context.Services.AddCors(options =>
        {
            options.AddDefaultPolicy(builder =>
            {
                builder
                    .WithOrigins(
                        configuration["App:CorsOrigins"]?
                            .Split(",", StringSplitOptions.RemoveEmptyEntries)
                            .Select(o => o.RemovePostFix("/"))
                            .ToArray() ?? Array.Empty<string>()
                    )
                    .WithAbpExposedHeaders()
                    .SetIsOriginAllowedToAllowWildcardSubdomains()
                    .AllowAnyHeader()
                    .AllowAnyMethod()
                    .AllowCredentials();
            });
        });

        // 租户解析配置不从cookie里面解析
        Configure<AbpTenantResolveOptions>(options =>
        {
            var cookieTenantResolve = options.TenantResolvers.FirstOrDefault(d => d.Name == CookieTenantResolveContributor.ContributorName);
            if (cookieTenantResolve != null)
            {
                options.TenantResolvers.Remove(cookieTenantResolve);
            }
            var queryStringTenantResolve = options.TenantResolvers.FirstOrDefault(d => d.Name == QueryStringTenantResolveContributor.ContributorName);
            if (queryStringTenantResolve != null)
            {
                options.TenantResolvers.Remove(queryStringTenantResolve);
            }
            //options.TenantResolvers.Add(new QueryStringTenantResolveContributor());
            //options.TenantResolvers.Add(new RouteTenantResolveContributor());
            //options.TenantResolvers.Add(new HeaderTenantResolveContributor());
            //options.TenantResolvers.Add(new CookieTenantResolveContributor());
        });

        ConfigureSwaggerServices(context, configuration);
    }

    private static void ConfigureSwaggerServices(ServiceConfigurationContext context, IConfiguration configuration)
    {
        context.Services.AddAbpSwaggerGenWithOAuth(
            configuration["AuthServer:Authority"]!,
            new Dictionary<string, string>
            {
                    {"Net", "Net API"}
            },
            options =>
            {
                options.SwaggerDoc("v1", new OpenApiInfo { Title = "Net API", Version = "v1" });
                options.DocInclusionPredicate((_, description) => description.RelativePath != null && description.RelativePath switch
                {
                    _ when description.RelativePath.StartsWith("api/app") => false,
                    _ when description.RelativePath.StartsWith("api/abp") => false,
                    _ => true
                });
                options.CustomSchemaIds(type => type.FullName);
            });
    }

    public override void OnApplicationInitialization(ApplicationInitializationContext context)
    {
        var app = context.GetApplicationBuilder();
        var env = context.GetEnvironment();

        if (env.IsDevelopment())
        {
            app.UseDeveloperExceptionPage();
        }

        app.UseAbpRequestLocalization();

        if (!env.IsDevelopment())
        {
            app.UseErrorPage();
        }

        app.UseCorrelationId();
        app.UseStaticFiles();
        app.UseRouting();
        app.UseCors();
        app.UseAuthentication();

        app.UseSwagger();
        app.UseAbpSwaggerUI(options =>
        {
            options.SwaggerEndpoint("/swagger/v1/swagger.json", "Net API");

            var configuration = context.GetConfiguration();
            options.OAuthClientId(configuration["AuthServer:SwaggerClientId"]);
            options.OAuthScopes("Net");
        });

        app.UseAbpOpenIddictValidation();

        if (MultiTenancyConsts.IsEnabled)
        {
            app.UseMultiTenancy();
        }

        app.UseUnitOfWork();
        app.UseAuthorization();
        app.UseAuditing();
        app.UseAbpSerilogEnrichers();
        app.UseConfiguredEndpoints();
    }
}
