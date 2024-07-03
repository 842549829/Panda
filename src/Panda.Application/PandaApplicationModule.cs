using Panda.Application.Contracts;
using Panda.Domain;
using Volo.Abp.Modularity;
using Volo.Abp.PermissionManagement;

namespace Panda.Application;

[DependsOn(
    typeof(PandaDomainModule),
    typeof(PandaApplicationContractsModule),
    typeof(AbpPermissionManagementApplicationModule)
)]
public class PandaApplicationModule: AbpModule;