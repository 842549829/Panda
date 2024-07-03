using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Panda.DataDictionary.Domain;
using Panda.DataDictionary.EntityFrameworkCore.DbContext;
using Panda.DataPermission.EntityFrameworkCore.EntityFrameworkCore;
using Volo.Abp.EntityFrameworkCore;
using Volo.Abp.EntityFrameworkCore.MySQL;
using Volo.Abp.Modularity;
using Volo.Abp.PermissionManagement.EntityFrameworkCore;

namespace Panda.DataDictionary.EntityFrameworkCore;

[DependsOn(
    typeof(AbpEntityFrameworkCoreMySQLModule),
    typeof(AbpPermissionManagementEntityFrameworkCoreModule),
    typeof(DictionaryDomainModule),
    typeof(DataPermissionEntityFrameworkCoreModule)
)]
public class DictionaryEntityFrameworkCoreModule : AbpModule
{
    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        context.Services.AddAbpDbContext<DataDictionaryDbContext>(options =>
        {
            /* Remove "includeAllEntities: true" to create
             * default repositories only for aggregate roots */
            //options.AddDefaultRepositories(includeAllEntities: true);
            options.AddDefaultRepositories<IDataDictionaryDbContext>(includeAllEntities: true);
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