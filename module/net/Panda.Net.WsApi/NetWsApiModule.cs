using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Panda.Messaging.Domain.Options;
using Panda.Net.Localization;
using Panda.Net.MessageProviders.PublishProviders;
using Panda.Net.MessageProviders.PushProviders;
using Volo.Abp.AspNetCore;
using Volo.Abp.Localization;
using Volo.Abp.Modularity;

namespace Panda.Net;

[DependsOn(
    typeof(NetApplicationModule),
    typeof(AbpAspNetCoreModule)
)]
public class NetWsApiModule : AbpModule
{
    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        ConfigureLocalization();
        ConfigureSignalR(context);
        ConfigureMessaging();
    }

    private void ConfigureLocalization()
    {
        Configure<AbpLocalizationOptions>(options =>
        {
            options.Resources
                .Get<NetResource>();
        });
    }

    private static void ConfigureSignalR(ServiceConfigurationContext context)
    {
        var configuration = context.Services.GetConfiguration();
        context.Services.AddSignalR()
            // 添加redis的支持使其支持分布式部署且不用考虑网关粘性会话配置
            .AddStackExchangeRedis(configuration["Redis:Configuration"]!, options =>
            {
                options.Configuration.ChannelPrefix = "Panda:Net:WebSocket";
            }); ;
    }


    private void ConfigureMessaging()
    {
        Configure<MessagingOptions>(options =>
        {
            options.PublishProviders.AddIfNotContains(typeof(UserMessagePublishProvider));
            options.PushersProvider.AddIfNotContains(typeof(SystemMessagePushersProvider));
        });
    }
}