using Panda.Domain;
using Panda.Domain.Shared;
using Volo.Abp.Modularity;

namespace Panda.DataDictionary.Domain;

[DependsOn(typeof(PandaDomainSharedModule),
    typeof(PandaDomainModule))]
public class DictionaryDomainModule : AbpModule;