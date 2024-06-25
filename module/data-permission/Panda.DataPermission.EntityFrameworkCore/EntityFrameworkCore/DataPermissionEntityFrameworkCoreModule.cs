using Volo.Abp.EntityFrameworkCore;
using Volo.Abp.Modularity;

namespace Panda.DataPermission.EntityFrameworkCore.EntityFrameworkCore;

[DependsOn(typeof(AbpEntityFrameworkCoreModule))]
public class DataPermissionEntityFrameworkCoreModule : AbpModule;