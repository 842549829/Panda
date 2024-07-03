using Panda.Domain.Shared;
using Volo.Abp.Modularity;
using Volo.Abp.PermissionManagement;

namespace Panda.Domain;

[DependsOn(typeof(PandaDomainSharedModule),
    typeof(AbpPermissionManagementDomainModule))]
public class PandaDomainModule: AbpModule;