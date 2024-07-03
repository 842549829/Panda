using Panda.Domain.Shared;
using Volo.Abp.Modularity;
using Volo.Abp.PermissionManagement;

namespace Panda.Application.Contracts;

[DependsOn(
    typeof(PandaDomainSharedModule),
    typeof(AbpPermissionManagementApplicationContractsModule)
)]
public class PandaApplicationContractsModule : AbpModule
{
}