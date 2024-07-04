namespace Panda.DbMigrator.Data;

public interface IPandaDbMigrationService
{
    Task MigrateAsync();
}