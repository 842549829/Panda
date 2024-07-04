using Volo.Abp.DependencyInjection;

namespace Panda.DbMigrator.Data;

public class NullPandaDbSchemaMigrator: IPandaDbSchemaMigrator, ITransientDependency
{
    public Task MigrateAsync()
    {
        return Task.CompletedTask;
    }
}