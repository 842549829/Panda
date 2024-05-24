using Microsoft.Extensions.DependencyInjection;
using Panda.File.Application.Contracts;
using Panda.File.HttpApi.TusdotNet;
using Volo.Abp.Modularity;
using Volo.Abp.PermissionManagement.HttpApi;

namespace Panda.File.HttpApi;

[DependsOn(typeof(AbpPermissionManagementHttpApiModule),
    typeof(FileApplicationContractsModule))]
public class FileHttpApiModule : AbpModule
{
    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        context.Services.AddHttpContextAccessor();
        context.Services.AddSingleton(services => services.CreateTusConfigurationForCleanupService());
        context.Services.AddSingleton<TusDiskStorageOptionHelper>();
        context.Services.AddHostedService<ExpiredFilesCleanupService>();
    }
}