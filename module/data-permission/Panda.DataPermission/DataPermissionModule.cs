using Microsoft.Extensions.DependencyInjection;
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
    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        context.Services.AddSingleton<ICurrentDataPermissionAccessor>(AsyncLocalCurrentDataPermissionAccessor.Instance);
        Configure<PandaAspDataPermissionResolveOptions>(options =>
        {
            options.DataPermissionResolves.Insert(0, new CurrentUserResolveContributor());
        });
    }
}