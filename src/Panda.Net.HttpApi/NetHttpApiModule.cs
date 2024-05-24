using Panda.Net.Localization;
using Volo.Abp.AspNetCore;
using Volo.Abp.Localization;
using Volo.Abp.Modularity;

namespace Panda.Net;

[DependsOn(
    typeof(NetApplicationContractsModule),
    typeof(AbpAspNetCoreModule)
    )]
public class NetHttpApiModule : AbpModule
{
    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        ConfigureLocalization();
    }

    private void ConfigureLocalization()
    {
        Configure<AbpLocalizationOptions>(options =>
        {
            options.Resources
                .Get<NetResource>();
        });
    }
}
