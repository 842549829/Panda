using Panda.Application;
using Panda.DataDictionary.Application.Contracts;
using Panda.DataDictionary.Domain;
using Volo.Abp.AutoMapper;
using Volo.Abp.Modularity;

namespace Panda.DataDictionary.Application;

[DependsOn(
    typeof(DictionaryDomainModule),
    typeof(DictionaryApplicationContractsModule),
    typeof(PandaApplicationModule),
    typeof(AbpAutoMapperModule)
)]
public class DictionaryApplicationModule : AbpModule
{
    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        Configure<AbpAutoMapperOptions>(options =>
        {
            options.AddMaps<DictionaryApplicationModule>();
        });
    }
}