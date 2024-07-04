namespace Panda.DbMigrator.Data;

public interface IPandaDbSchemaMigrator
{
    Task MigrateAsync();
}