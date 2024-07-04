using Volo.Abp.Autofac;
using Volo.Abp.Data;
using Volo.Abp.Modularity;
using Volo.Abp.TenantManagement;

namespace Panda.DbMigrator;

[DependsOn(typeof(AbpDataModule),
    typeof(AbpAutofacModule),
    typeof(AbpTenantManagementDomainModule)
    )]
public class PandaDbMigratorModule : AbpModule
{

}