using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Panda.DataPermission.EntityFrameworkCore.EntityFrameworkCore;
using Panda.DataSend.Domain;
using Panda.DataSend.EntityFrameworkCore.DbContext;
using Panda.EntityFrameworkCore;
using Volo.Abp.EntityFrameworkCore;
using Volo.Abp.EntityFrameworkCore.MySQL;
using Volo.Abp.Modularity;

namespace Panda.DataSend.EntityFrameworkCore;


[DependsOn(
    typeof(AbpEntityFrameworkCoreMySQLModule),
    typeof(PandaEntityFrameworkCoreModule),
    typeof(DataSendDomainModule),
    typeof(DataPermissionEntityFrameworkCoreModule)
)]
public class DataSendEntityFrameworkCoreModule : AbpModule
{
    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        context.Services.AddAbpDbContext<DataSendDbContext>(options =>
        {
            /* Remove "includeAllEntities: true" to create
             * default repositories only for aggregate roots */
            //options.AddDefaultRepositories(includeAllEntities: true);
            options.AddDefaultRepositories<DataSendDbContext>(includeAllEntities: true);
            //options.AddRepository<Message, MessageRepository>();
        });

        Configure<AbpDbContextOptions>(options =>
        {
            /* The main point to change your DBMS.
             * See also MessageMigrationsDbContextFactory for EF Core tooling. */
            options.UseMySQL(optionsBuilder =>
            {
                optionsBuilder.UseQuerySplittingBehavior(QuerySplittingBehavior.SingleQuery);
            });
        });
    }
}