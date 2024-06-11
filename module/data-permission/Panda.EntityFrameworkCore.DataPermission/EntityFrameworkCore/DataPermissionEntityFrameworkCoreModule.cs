using Volo.Abp.EntityFrameworkCore;
using Volo.Abp.Modularity;

namespace Panda.EntityFrameworkCore.DataPermission.EntityFrameworkCore;

[DependsOn(typeof(AbpEntityFrameworkCoreModule))]
public class DataPermissionEntityFrameworkCoreModule : AbpModule;