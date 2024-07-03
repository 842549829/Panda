using Panda.Application.Contracts;
using Volo.Abp.Modularity;
using Volo.Abp.PermissionManagement.HttpApi;

namespace Panda.HttpApi;

[DependsOn(
    typeof(PandaApplicationContractsModule),
    typeof(AbpPermissionManagementHttpApiModule)
)]

public class PandaHttpApiModule : AbpModule;