using Abp.WorkflowCore.Persistence.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Panda.Net.EntityFrameworkCore;
using Panda.Workflow.Domain;
using Panda.Workflow.EntityFrameworkCore.EntityFrameworkCore.DbContext;
using Volo.Abp.EntityFrameworkCore;
using Volo.Abp.EntityFrameworkCore.MySQL;
using Volo.Abp.Modularity;

namespace Panda.Workflow.EntityFrameworkCore;

[DependsOn(
    typeof(WorkflowDomainModule),
    typeof(AbpWorkflowCoreEfCoreModule),
    typeof(AbpEntityFrameworkCoreMySQLModule),
    typeof(NetEntityFrameworkCoreModule)
)]
public class WorkflowEntityFrameworkCoreModule : AbpModule
{
    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        context.Services.AddAbpDbContext<WorkflowDbContext>(options =>
        {
            /* Remove "includeAllEntities: true" to create
             * default repositories only for aggregate roots */
            //options.AddDefaultRepositories(includeAllEntities: true);
            options.AddDefaultRepositories(true);
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