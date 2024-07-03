using Medallion.Threading;
using Medallion.Threading.Redis;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.OpenApi.Models;
using StackExchange.Redis;
using Volo.Abp.Modularity;

namespace Panda.HttpApi.Host.Configurations;

public static class PandaHttpApiHostConfigurationExtensions
{
    public static void ConfigureCors(this ServiceConfigurationContext context, string defaultCorsPolicyName)
    {
        context.Services.AddCors(options =>
        {
            options.AddPolicy(defaultCorsPolicyName, builder =>
            {
                builder.AllowAnyMethod()
                    .SetIsOriginAllowed(_ => true)
                    .AllowAnyHeader()
                    .AllowCredentials();
            });
        });
    }

    public static void ConfigureDistributedLocking(this
        ServiceConfigurationContext context,
        IConfiguration configuration,
        string connectionName = "Redis:Configuration")
    {
        context.Services.AddSingleton<IDistributedLockProvider>(_ =>
        {
            var connection = ConnectionMultiplexer.Connect(configuration[connectionName]!);
            return new RedisDistributedSynchronizationProvider(connection.GetDatabase());
        });
    }

    public static void ConfigureDataProtection(this
        ServiceConfigurationContext context,
        IConfiguration configuration,
        IHostEnvironment hostingEnvironment,
        string applicationName,
        string connectionName = "Redis:Configuration")
    {
        var dataProtectionBuilder = context.Services.AddDataProtection().SetApplicationName(applicationName);
        if (hostingEnvironment.IsDevelopment())
        {
            return;
        }
        var redis = ConnectionMultiplexer.Connect(configuration[connectionName]!);
        dataProtectionBuilder.PersistKeysToStackExchangeRedis(redis, $"{applicationName}-Protection-Keys");
    }

    public static void ConfigureAuthentication(this ServiceConfigurationContext context, IConfiguration configuration,
        string authority = "AuthServer:Authority",
        string requireHttpsMetadata = "AuthServer:RequireHttpsMetadata",
        string audience = "Net")
    {
        context.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
            .AddJwtBearer(options =>
            {
                options.Authority = configuration[authority];
                options.RequireHttpsMetadata = Convert.ToBoolean(configuration[requireHttpsMetadata]);
                options.Audience = audience;

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

    public static void ConfigureSwaggerServices(this ServiceConfigurationContext context, IConfiguration configuration,
        string applicationName,
        string authority = "AuthServer:Authority")
    {
        context.Services.AddAbpSwaggerGenWithOAuth(
            configuration[authority]!,
            new Dictionary<string, string>
            {
                    {applicationName, $"{applicationName} API"}
            },
            options =>
            {
                options.SwaggerDoc("v1", new OpenApiInfo { Title = $"{applicationName} API", Version = "v1" });
                options.DocInclusionPredicate((_, description) => description.RelativePath != null && description.RelativePath switch
                {
                    _ when description.RelativePath.StartsWith("api/app") => false,
                    _ when description.RelativePath.StartsWith("api/abp") => false,
                    _ when description.RelativePath.StartsWith("api/permission-management") => false,
                    _ => true
                });
                options.CustomSchemaIds(type => type.FullName);
            });
    }

}