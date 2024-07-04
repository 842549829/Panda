using Panda.DataDictionary.Domain.Shared.Localization;
using Panda.Domain.Shared;
using Volo.Abp.Localization;
using Volo.Abp.Localization.ExceptionHandling;
using Volo.Abp.Modularity;
using Volo.Abp.Validation.Localization;
using Volo.Abp.VirtualFileSystem;

namespace Panda.DataDictionary.Domain.Shared;

[DependsOn(
    typeof(PandaDomainSharedModule)
)]
public class DictionaryDomainSharedModule : AbpModule
{
    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        Configure<AbpVirtualFileSystemOptions>(options =>
        {
            options.FileSets.AddEmbedded<DictionaryDomainSharedModule>();
        });

        Configure<AbpLocalizationOptions>(options =>
        {
            options.Resources
                .Add<DataDictionaryResource>("zh-Hans")
                .AddBaseTypes(typeof(AbpValidationResource))
                .AddVirtualJson("/Localization/DataDictionary");

            options.DefaultResourceType = typeof(DataDictionaryResource);
        });

        Configure<AbpExceptionLocalizationOptions>(options =>
        {
            options.MapCodeNamespace("DataDictionary", typeof(DataDictionaryResource));
        });
    }
}