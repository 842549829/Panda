using Panda.Messaging.Domain.Shared;
using Volo.Abp.Modularity;
using Volo.Abp.ObjectExtending;

namespace Panda.Messaging.Application.Contracts;

[DependsOn(
    typeof(MessageDomainSharedModule),
    typeof(AbpObjectExtendingModule)
)]
public class MessageApplicationContractsModule : AbpModule
{
    public override void PreConfigureServices(ServiceConfigurationContext context)
    {
        MessageDtoExtensions.Configure();
    }
}