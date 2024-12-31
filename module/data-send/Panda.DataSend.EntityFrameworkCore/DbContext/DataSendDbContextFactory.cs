using Microsoft.EntityFrameworkCore.Design;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Panda.DataSend.EntityFrameworkCore.DbContext;

public class DataSendDbContextFactory : IDesignTimeDbContextFactory<DataSendDbContext>
{
    public DataSendDbContext CreateDbContext(string[] args)
    {
        var configuration = BuildConfiguration();
        var builder = new DbContextOptionsBuilder<DataSendDbContext>()
            .UseMySql(configuration.GetConnectionString("Default")!, MySqlServerVersion.LatestSupportedServerVersion);
        return new DataSendDbContext(builder.Options);
    }

    private static IConfigurationRoot BuildConfiguration()
    {
        var builder = new ConfigurationBuilder()
            .SetBasePath(Path.Combine(Directory.GetCurrentDirectory(), "../Panda.DataSend.DbMigrator/"))
            .AddJsonFile("appsettings.json", optional: false);

        return builder.Build();
    }
}