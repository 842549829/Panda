using Volo.Abp.Modularity;
using Volo.Abp.PermissionManagement;

namespace Panda.File.Domain.Shared;

[DependsOn(typeof(AbpPermissionManagementDomainSharedModule))]
public class FileDomainSharedModule : AbpModule;