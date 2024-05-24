using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Panda.Messaging.Domain.Options;
using Panda.Messaging.Domain.Providers;
using Panda.Messaging.Domain.Shared;
using Volo.Abp.BackgroundJobs;
using Volo.Abp.Emailing;
using Volo.Abp.Modularity;

namespace Panda.Messaging.Domain;

[DependsOn(
    typeof(MessageDomainSharedModule),
    typeof(AbpBackgroundJobsDomainModule),
    typeof(AbpEmailingModule)
    //,typeof(Volo.Abp.EventBus.RabbitMq.AbpEventBusRabbitMqModule)
)]
public class MessageDomainModule : AbpModule
{
    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        //// 代码配置 实际配置写在配置文件里了
        //Configure<AbpRabbitMqOptions>(options =>
        //{

        //});
        //Configure<AbpRabbitMqEventBusOptions>(options =>
        //{
        //});

        Configure<MessagingOptions>(options =>
        {
            options.PublishProviders.AddIfNotContains(typeof(SystemMessagePublishProvider));
        });

#if DEBUG
        context.Services.Replace(ServiceDescriptor.Singleton<IEmailSender, NullEmailSender>());
#endif
    }
}
