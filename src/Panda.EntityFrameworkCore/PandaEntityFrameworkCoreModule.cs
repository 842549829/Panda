using Panda.Domain;
using Volo.Abp.Modularity;
using Volo.Abp.PermissionManagement.EntityFrameworkCore;

namespace Panda.EntityFrameworkCore;

[DependsOn(
    typeof(AbpPermissionManagementEntityFrameworkCoreModule),
    typeof(PandaDomainModule))]
public class PandaEntityFrameworkCoreModule : AbpModule;