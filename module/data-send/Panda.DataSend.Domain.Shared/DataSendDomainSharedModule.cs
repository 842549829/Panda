using Panda.Domain.Shared;
using Volo.Abp.Modularity;

namespace Panda.DataSend.Domain.Shared;

[DependsOn(
    typeof(PandaDomainSharedModule)
)]
public class DataSendDomainSharedModule : AbpModule;