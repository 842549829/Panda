using Panda.DataDictionary.Application.Contracts;
using Panda.DataPermission.AspNetCore;
using Volo.Abp.Modularity;
using Volo.Abp.PermissionManagement.HttpApi;

namespace Panda.DataDictionary.HttpApi;


[DependsOn(typeof(AbpPermissionManagementHttpApiModule),
    typeof(DictionaryApplicationContractsModule),
    typeof(PandaAspNetCoreDataPermissionModule)
    )]
public class DictionaryHttpApiModule : AbpModule;