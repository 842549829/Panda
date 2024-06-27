using Volo.Abp.AspNetCore;
using Volo.Abp.Modularity;
using Volo.Abp.MultiTenancy;

namespace Panda.DataPermission.AspNetCore;

[DependsOn(
    typeof(AbpMultiTenancyModule),
    typeof(AbpAspNetCoreModule)
)]
public class PandaAspNetCoreDataPermissionModule : AbpModule
{
    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        Configure<PandaAspDataPermissionResolveOptions>(options =>
        {
            options.DataPermissionResolves.Add(new QueryStringDataPermissionResolveContributor());
            options.DataPermissionResolves.Add(new HeaderDataPermissionResolveContributor());
            options.DataPermissionResolves.Add(new CookieDataPermissionResolveContributor());
        });
    }
}