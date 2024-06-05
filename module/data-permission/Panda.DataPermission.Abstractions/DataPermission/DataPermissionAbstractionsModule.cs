using Panda.DataPermission.Abstractions.DataPermission.Localization;
using Volo.Abp.Localization;
using Volo.Abp.Modularity;
using Volo.Abp.VirtualFileSystem;

namespace Panda.DataPermission.Abstractions.DataPermission;

[DependsOn(
    typeof(AbpVirtualFileSystemModule),
    typeof(AbpLocalizationModule)
)]
public class DataPermissionAbstractionsModule : AbpModule
{
    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        Configure<AbpVirtualFileSystemOptions>(options =>
        {
            options.FileSets.AddEmbedded<DataPermissionAbstractionsModule>();
        });

        Configure<AbpLocalizationOptions>(options =>
        {
            options.Resources
                .Add<DataPermissionResource>("en")
                .AddVirtualJson("/DataPermission/Localization");
        });
    }
}