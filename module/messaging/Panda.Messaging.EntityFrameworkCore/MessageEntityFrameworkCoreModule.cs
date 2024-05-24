using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Panda.Messaging.Domain;
using Panda.Messaging.Domain.Entities;
using Panda.Messaging.EntityFrameworkCore.EntityFrameworkCore.DbContext;
using Panda.Messaging.EntityFrameworkCore.EntityFrameworkCore.Repositories;
using Volo.Abp.BackgroundJobs.EntityFrameworkCore;
using Volo.Abp.EntityFrameworkCore;
using Volo.Abp.EntityFrameworkCore.MySQL;
using Volo.Abp.Modularity;

namespace Panda.Messaging.EntityFrameworkCore;

[DependsOn(
    typeof(MessageDomainModule),
    typeof(AbpEntityFrameworkCoreMySQLModule),
    typeof(AbpBackgroundJobsEntityFrameworkCoreModule)
    )]
public class MessageEntityFrameworkCoreModule : AbpModule
{
    public override void PreConfigureServices(ServiceConfigurationContext context)
    {
        MessageEfCoreEntityExtensionMappings.Configure();
    }

    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        context.Services.AddAbpDbContext<MessageDbContext>(options =>
        {
            /* Remove "includeAllEntities: true" to create
             * default repositories only for aggregate roots */
            //options.AddDefaultRepositories(includeAllEntities: true);
            options.AddDefaultRepositories<IMessageDbContext>(includeAllEntities: true);
            options.AddRepository<Message, MessageRepository>();
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
