using Panda.DataDictionary.Application.Contracts;
using Panda.DataPermission.AspNetCore;
using Panda.HttpApi;
using Volo.Abp;
using Volo.Abp.Modularity;

namespace Panda.DataDictionary.HttpApi;


[DependsOn(typeof(PandaHttpApiModule),
    typeof(DictionaryApplicationContractsModule),
    typeof(PandaAspNetCoreDataPermissionModule)
)]
public class DictionaryHttpApiModule : AbpModule
{
    public override void OnApplicationInitialization(ApplicationInitializationContext context)
    {
        var app = context.GetApplicationBuilder();
        app.UseDataPermission();
    }
}