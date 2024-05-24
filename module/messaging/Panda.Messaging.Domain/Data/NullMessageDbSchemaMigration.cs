namespace Panda.Messaging.Domain.Data;

public class NullMessageDbSchemaMigration : IMessageDbSchemaMigration
{
    public Task MigrateAsync()
    {
        return Task.CompletedTask;
    }
}
