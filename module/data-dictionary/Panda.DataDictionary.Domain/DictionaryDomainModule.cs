using Panda.DataDictionary.Domain.Shared;
using Panda.DataPermission;
using Volo.Abp.Modularity;
using Volo.Abp.PermissionManagement;

namespace Panda.DataDictionary.Domain;

[DependsOn(typeof(DictionaryDomainSharedModule),
    typeof(AbpPermissionManagementDomainModule),
    typeof(DataPermissionModule))]
public class DictionaryDomainModule : AbpModule;