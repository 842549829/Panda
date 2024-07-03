using Panda.Domain.Shared;
using Volo.Abp.Modularity;

namespace Panda.DataDictionary.Domain.Shared;

[DependsOn(
    typeof(PandaDomainSharedModule)
)]
public class DictionaryDomainSharedModule : AbpModule;