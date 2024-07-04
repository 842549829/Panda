using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;

namespace Panda.DataDictionary.EntityFrameworkCore.DbContext;


/*
 * 1. dotnet ef migrations add init -c DataDictionaryDbContext
 * 2. dotnet ef database update -c DataDictionaryDbContext
 */
public class DataDictionaryDbContextFactory : IDesignTimeDbContextFactory<DataDictionaryDbContext>
{
    public DataDictionaryDbContext CreateDbContext(string[] args)
    {
        var configuration = BuildConfiguration();
        var builder = new DbContextOptionsBuilder<DataDictionaryDbContext>()
            .UseMySql(configuration.GetConnectionString("Default")!, MySqlServerVersion.LatestSupportedServerVersion);
        return new DataDictionaryDbContext(builder.Options);
    }

    private static IConfigurationRoot BuildConfiguration()
    {
        var builder = new ConfigurationBuilder()
            .SetBasePath(Path.Combine(Directory.GetCurrentDirectory(), "../Panda.DataDictionary.HttpApi.Host/"))
            .AddJsonFile("appsettings.json", optional: false);

        return builder.Build();
    }
}
