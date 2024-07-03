using Panda.DataDictionary.Domain.Shared;
using Volo.Abp.Modularity;
using Volo.Abp.PermissionManagement;

namespace Panda.DataDictionary.Application.Contracts;

[DependsOn(
    typeof(DictionaryDomainSharedModule),
    typeof(AbpPermissionManagementApplicationContractsModule)
)]
public class DictionaryApplicationContractsModule : AbpModule;