using Panda.DataPermission.Abstractions.DataPermission;
using Volo.Abp.EntityFrameworkCore;
using Volo.Abp.Modularity;

namespace Panda.DataPermission.EntityFrameworkCore.EntityFrameworkCore;

[DependsOn(typeof(AbpEntityFrameworkCoreModule),
    typeof(DataPermissionAbstractionsModule)
)]
public class DataPermissionEntityFrameworkCoreModule : AbpModule;