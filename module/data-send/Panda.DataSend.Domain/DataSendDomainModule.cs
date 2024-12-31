using Panda.DataPermission;
using Panda.Domain;
using Volo.Abp.Modularity;
using Panda.DataSend.Domain.Shared;

namespace Panda.DataSend.Domain;

[DependsOn(typeof(DataSendDomainSharedModule),
    typeof(PandaDomainModule),
    typeof(DataPermissionModule))]
public class DataSendDomainModule : AbpModule
{
}