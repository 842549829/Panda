using Panda.File.Application.Contracts;
using Panda.File.Domain;
using Volo.Abp.AutoMapper;
using Volo.Abp.Modularity;
using Volo.Abp.PermissionManagement;

namespace Panda.File.Application;

[DependsOn(
    typeof(FileDomainModule),
    typeof(FileApplicationContractsModule),
    typeof(AbpPermissionManagementApplicationModule)
)]
public class FileApplicationModule : AbpModule
{
    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        Configure<AbpAutoMapperOptions>(options =>
        {
            options.AddMaps<FileApplicationModule>();
        });
    }
}