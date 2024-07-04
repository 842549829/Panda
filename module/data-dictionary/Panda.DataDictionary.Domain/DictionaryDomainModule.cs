using Panda.DataPermission;
using Panda.Domain;
using Panda.Domain.Shared;
using Volo.Abp.Modularity;

namespace Panda.DataDictionary.Domain;

[DependsOn(typeof(PandaDomainSharedModule),
    typeof(PandaDomainModule),
    typeof(DataPermissionModule))]
public class DictionaryDomainModule : AbpModule;