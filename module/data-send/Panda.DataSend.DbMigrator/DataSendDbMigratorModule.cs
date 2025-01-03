﻿using Panda.DataSend.EntityFrameworkCore;
using Panda.DbMigrator;
using Panda.EntityFrameworkCore;
using Volo.Abp.Caching;
using Volo.Abp.Caching.StackExchangeRedis;
using Volo.Abp.Modularity;
using Volo.Abp.MultiTenancy;
using Volo.Abp.TenantManagement.EntityFrameworkCore;

namespace Panda.DataSend.DbMigrator;

[DependsOn(
    typeof(AbpCachingStackExchangeRedisModule),
    typeof(PandaEntityFrameworkCoreModule),
    typeof(PandaDbMigratorModule),
    typeof(AbpMultiTenancyModule),
    typeof(AbpTenantManagementEntityFrameworkCoreModule),
    typeof(DataSendEntityFrameworkCoreModule)
)]
public class DataSendDbMigratorModule : AbpModule
{
    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        Configure<AbpDistributedCacheOptions>(options => { options.KeyPrefix = "Net:"; });

        //Configure<AbpDbContextOptions>(options =>
        //{
        //    /* The main point to change your DBMS.
        //     * See also MessageMigrationsDbContextFactory for EF Core tooling. */
        //    options.UseMySQL(optionsBuilder =>
        //    {
        //        optionsBuilder.UseQuerySplittingBehavior(QuerySplittingBehavior.SingleQuery);
        //    });
        //});
    }
}