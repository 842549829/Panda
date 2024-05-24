using Volo.Abp.DependencyInjection;

namespace Panda.Messaging.Domain.Data;

public interface IMessageDbSchemaMigration : ITransientDependency
{
    Task MigrateAsync();
}
