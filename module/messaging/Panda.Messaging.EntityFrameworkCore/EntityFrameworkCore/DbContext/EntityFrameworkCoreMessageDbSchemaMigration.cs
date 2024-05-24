using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Panda.Messaging.Domain.Data;
using Volo.Abp.DependencyInjection;

namespace Panda.Messaging.EntityFrameworkCore.EntityFrameworkCore.DbContext;

public class EntityFrameworkCoreMessageDbSchemaMigration
    : IMessageDbSchemaMigration, ITransientDependency
{
    private readonly IServiceProvider _serviceProvider;

    public EntityFrameworkCoreMessageDbSchemaMigration(
        IServiceProvider serviceProvider)
    {
        _serviceProvider = serviceProvider;
    }

    public async Task MigrateAsync()
    {
        /* We intentionally resolving the MessageDbContext
         * from IServiceProvider (instead of directly injecting it)
         * to properly get the connection string of the current tenant in the
         * current scope.
         */

        await _serviceProvider
            .GetRequiredService<MessageDbContext>().Database.MigrateAsync();
    }
}
