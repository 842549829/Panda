using Panda.File.Domain.Shared;
using Volo.Abp.Modularity;
using Volo.Abp.PermissionManagement;

namespace Panda.File.Domain;

[DependsOn(typeof(FileDomainSharedModule),
    typeof(AbpPermissionManagementDomainModule))]
public class FileDomainModule : AbpModule;