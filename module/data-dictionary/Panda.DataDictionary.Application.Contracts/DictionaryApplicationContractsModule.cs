using Panda.Application.Contracts;
using Panda.DataDictionary.Domain.Shared;
using Volo.Abp.Modularity;

namespace Panda.DataDictionary.Application.Contracts;

[DependsOn(
    typeof(DictionaryDomainSharedModule),
    typeof(PandaApplicationContractsModule)
)]
public class DictionaryApplicationContractsModule : AbpModule;