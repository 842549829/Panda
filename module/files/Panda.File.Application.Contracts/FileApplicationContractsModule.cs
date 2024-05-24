using Panda.File.Domain.Shared;
using Volo.Abp.Modularity;
using Volo.Abp.PermissionManagement;

namespace Panda.File.Application.Contracts;

[DependsOn(
    typeof(FileDomainSharedModule),
    typeof(AbpPermissionManagementApplicationContractsModule)
)]
public class FileApplicationContractsModule : AbpModule;