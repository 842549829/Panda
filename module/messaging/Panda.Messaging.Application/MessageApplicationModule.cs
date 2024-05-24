using Panda.Messaging.Application.Contracts;
using Panda.Messaging.Domain;
using Volo.Abp.AutoMapper;
using Volo.Abp.Modularity;

namespace Panda.Messaging.Application;

[DependsOn(
    typeof(MessageDomainModule),
    typeof(MessageApplicationContractsModule)
    )]
public class MessageApplicationModule : AbpModule
{
    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        Configure<AbpAutoMapperOptions>(options =>
        {
            options.AddMaps<MessageApplicationModule>();
        });
    }
}
