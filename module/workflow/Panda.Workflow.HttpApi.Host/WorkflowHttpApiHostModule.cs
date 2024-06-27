using Abp.WorkflowCore.Persistence.EntityFrameworkCore;
using Medallion.Threading.Redis;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.OpenApi.Models;
using Panda.Workflow.Application;
using Panda.Workflow.Application.Contracts;
using Panda.Workflow.Domain;
using Panda.Workflow.Domain.Shared;
using Panda.Workflow.Domain.Shared.MultiTenancy;
using Panda.Workflow.EntityFrameworkCore;
using StackExchange.Redis;
using Volo.Abp;
using Volo.Abp.AspNetCore.MultiTenancy;
using Volo.Abp.AspNetCore.Mvc.AntiForgery;
using Volo.Abp.AspNetCore.Serilog;
using Volo.Abp.Autofac;
using Volo.Abp.Caching;
using Volo.Abp.Caching.StackExchangeRedis;
using Volo.Abp.DistributedLocking;
using Volo.Abp.Modularity;
using Volo.Abp.Swashbuckle;
using Volo.Abp.VirtualFileSystem;
using WorkflowCore;
using WorkflowCore.DSL;
using WorkflowCore.Interface;
using WorkflowCore.Interface.Persistence;
using IDistributedLockProvider = Medallion.Threading.IDistributedLockProvider;

namespace Panda.Workflow.HttpApi.Host;

[DependsOn(
    typeof(WorkflowHttpApiModule),
    typeof(AbpAutofacModule),
    typeof(AbpCachingStackExchangeRedisModule),
    typeof(AbpDistributedLockingModule),
    typeof(AbpAspNetCoreMultiTenancyModule),
    typeof(WorkflowApplicationModule),
    typeof(WorkflowEntityFrameworkCoreModule),
    typeof(AbpAspNetCoreSerilogModule),
    typeof(AbpSwashbuckleModule)
)]
public class WorkflowHttpApiHostModule : AbpModule
{
    private const string DefaultCorsPolicyName = "Default";

    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        var configuration = context.Services.GetConfiguration();
        var hostingEnvironment = context.Services.GetHostingEnvironment();

        ConfigureAuthentication(context, configuration);
        ConfigureCache();
        ConfigureVirtualFileSystem(context);
        ConfigureDataProtection(context, configuration, hostingEnvironment);
        ConfigureDistributedLocking(context, configuration);
        ConfigureCors(context);
        ConfigureSwaggerServices(context, configuration);
        ConfigureWorkflowCore(context);

        // 关闭防伪造验证
        Configure<AbpAntiForgeryOptions>(options => {
            options.AutoValidate = false;
        });
    }

    private void ConfigureCache()
    {
        Configure<AbpDistributedCacheOptions>(options => { options.KeyPrefix = "Workflow:"; });
    }

    private void ConfigureVirtualFileSystem(ServiceConfigurationContext context)
    {
        var hostingEnvironment = context.Services.GetHostingEnvironment();

        if (hostingEnvironment.IsDevelopment())
        {
            Configure<AbpVirtualFileSystemOptions>(options =>
            {
                options.FileSets.ReplaceEmbeddedByPhysical<WorkflowDomainSharedModule>(
                    Path.Combine(hostingEnvironment.ContentRootPath,
                        $"..{Path.DirectorySeparatorChar}Panda.Workflow.Domain.Shared"));
                options.FileSets.ReplaceEmbeddedByPhysical<WorkflowDomainModule>(
                    Path.Combine(hostingEnvironment.ContentRootPath,
                        $"..{Path.DirectorySeparatorChar}Panda.Workflow.Domain"));
                options.FileSets.ReplaceEmbeddedByPhysical<WorkflowApplicationContractsModule>(
                    Path.Combine(hostingEnvironment.ContentRootPath,
                        $"..{Path.DirectorySeparatorChar}Panda.Workflow.Application.Contracts"));
                options.FileSets.ReplaceEmbeddedByPhysical<WorkflowApplicationModule>(
                    Path.Combine(hostingEnvironment.ContentRootPath,
                        $"..{Path.DirectorySeparatorChar}Panda.Workflow.Application"));
            });
        }
    }

    private void ConfigureAuthentication(ServiceConfigurationContext context, IConfiguration configuration)
    {
        context.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
            .AddJwtBearer(options =>
            {
                options.Authority = configuration["AuthServer:Authority"];
                options.RequireHttpsMetadata = Convert.ToBoolean(configuration["AuthServer:RequireHttpsMetadata"]);
                options.Audience = "Net";

                // 添加自定义Token获取逻辑
                options.Events = new JwtBearerEvents
                {
                    OnMessageReceived = messageReceivedContext =>
                    {
                        // 如果Header中未找到Token，尝试从URL中获取
                        if (messageReceivedContext.Request.Headers.ContainsKey("Authorization"))
                        {
                            return Task.CompletedTask;
                        }

                        // 示例：从查询参数中获取Token
                        if (messageReceivedContext.Request.Query.TryGetValue("access_token", out var token))
                        {
                            messageReceivedContext.Token = token;
                        }
                        else
                        {
                            // 或者从特定路径段（例如路由参数）获取Token
                            // string token = context.Request.RouteValues["token"] as string;
                        }

                        return Task.CompletedTask;
                    }
                };
            });
    }

    private static void ConfigureSwaggerServices(ServiceConfigurationContext context, IConfiguration configuration)
    {
        context.Services.AddAbpSwaggerGenWithOAuth(
            configuration["AuthServer:Authority"]!,
            new Dictionary<string, string>
            {
                    {"Workflow", "Workflow API"}
            },
            options =>
            {
                options.SwaggerDoc("v1", new OpenApiInfo { Title = "Workflow API", Version = "v1" });
                options.DocInclusionPredicate((_, description) => description.RelativePath != null && description.RelativePath switch
                {
                    _ when description.RelativePath.StartsWith("api/app") => false,
                    _ when description.RelativePath.StartsWith("api/abp") => false,
                    _ => true
                });
                options.CustomSchemaIds(type => type.FullName);
            });
    }

    public static void ConfigureWorkflowCore(ServiceConfigurationContext context)
    {
        context.Services.AddSingleton<IPersistenceProvider, AbpPersistenceProvider>();
        context.Services.AddWorkflow(options =>
        {
            options.UsePersistence(sp => sp.GetService<AbpPersistenceProvider>());
        });
        context.Services.AddWorkflowDSL();
    }

    public static void ConfigureDataProtection(
        ServiceConfigurationContext context,
        IConfiguration configuration,
        IHostEnvironment hostingEnvironment)
    {
        var dataProtectionBuilder = context.Services.AddDataProtection().SetApplicationName("Workflow");
        if (!hostingEnvironment.IsDevelopment())
        {
            var redis = ConnectionMultiplexer.Connect(configuration["Redis:Configuration"]!);
            dataProtectionBuilder.PersistKeysToStackExchangeRedis(redis, "Workflow-Protection-Keys");
        }
    }

    public static void ConfigureDistributedLocking(
        ServiceConfigurationContext context,
        IConfiguration configuration)
    {
        context.Services.AddSingleton<IDistributedLockProvider>(_ =>
        {
            var connection = ConnectionMultiplexer.Connect(configuration["Redis:Configuration"]!);
            return new RedisDistributedSynchronizationProvider(connection.GetDatabase());
        });
    }

    public static void ConfigureCors(ServiceConfigurationContext context)
    {
        context.Services.AddCors(options =>
        {
            options.AddPolicy(DefaultCorsPolicyName, builder =>
            {
                builder.AllowAnyMethod()
                    .SetIsOriginAllowed(_ => true)
                    .AllowAnyHeader()
                    .AllowCredentials();
            });
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
        app.UseCorrelationId();
        app.UseStaticFiles();
        app.UseRouting();
        app.UseCors(DefaultCorsPolicyName);
        app.UseAuthentication();

        if (MultiTenancyConsts.IsEnabled)
        {
            app.UseMultiTenancy();
        }

        app.UseAuthorization();

        app.UseSwagger();
        app.UseAbpSwaggerUI(options =>
        {
            options.SwaggerEndpoint("/swagger/v1/swagger.json", "Workflow API");

            var configuration = context.GetConfiguration();
            options.OAuthClientId(configuration["AuthServer:SwaggerClientId"]);
            options.OAuthScopes("Workflow");
        });

        app.UseAuditing();
        app.UseAbpSerilogEnrichers();
        app.UseUnitOfWork();
        app.UseConfiguredEndpoints();
    }
}