using Panda.DataPermission.Abstractions.DataPermission;
using Volo.Abp.Data;
using Volo.Abp.EventBus.Abstractions;
using Volo.Abp.Modularity;
using Volo.Abp.Security;
using Volo.Abp.Settings;

namespace Panda.DataPermission;

[DependsOn(
    typeof(AbpDataModule),
    typeof(AbpSecurityModule),
    typeof(AbpSettingsModule),
    typeof(AbpEventBusAbstractionsModule),
    typeof(DataPermissionAbstractionsModule)
)]

public class DataPermissionModule : AbpModule
{
}