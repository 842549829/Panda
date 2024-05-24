using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;

namespace Panda.Messaging.EntityFrameworkCore.EntityFrameworkCore.DbContext;

/* This class is needed for EF Core console commands
 * (like Add-Migration and Update-Database commands) */
public class MessageDbContextFactory : IDesignTimeDbContextFactory<MessageDbContext>
{
    public MessageDbContext CreateDbContext(string[] args)
    {
        MessageEfCoreEntityExtensionMappings.Configure();

        var connection = "Server=localhost;Port=3306;Database=YaDea;Uid=root;Pwd=123456;";
        var builder = new DbContextOptionsBuilder<MessageDbContext>()
            .UseMySql(connection, MySqlServerVersion.LatestSupportedServerVersion);
        return new MessageDbContext(builder.Options);
    }
}
