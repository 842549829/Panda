using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Panda.DataDictionary.Domain.DataDictionaries;
using Panda.DataDictionary.Domain.DataDictionaries.Entities;
using Panda.DataDictionary.EntityFrameworkCore.Configs;
using Panda.DataPermission.EntityFrameworkCore.EntityFrameworkCore;
using Volo.Abp.Data;

namespace Panda.DataDictionary.EntityFrameworkCore.DbContext;

[ConnectionStringName(DataDictionaryDbProperties.ConnectionStringName)]
public class DataDictionaryDbContext : DataPermissionDbContext<DataDictionaryDbContext>, IDataDictionaryDbContext
{
    public DataDictionaryDbContext(DbContextOptions<DataDictionaryDbContext> options) : base(options)
    {
    }

    public DbSet<DictCategory> DictCategories { get; set; } = default!;

    public DbSet<DictItem> DictItem { get; set; } = default!;


    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        // 设置 EF Core 日志级别，以便记录SQL语句
        optionsBuilder.LogTo(message =>
        {
            try
            {
                if (LazyServiceProvider != null && Logger != null)
                {
                    Logger.LogDebug(message);
                }
            }
            finally
            {
                Console.WriteLine(message);
            }
        }, new[] { Microsoft.EntityFrameworkCore.Diagnostics.RelationalEventId.CommandExecuting });
        optionsBuilder.EnableSensitiveDataLogging(); // 如果需要记录敏感数据，请谨慎启用此选
    }

    protected override void OnModelCreating(ModelBuilder builder)
    {
        base.OnModelCreating(builder);

        builder.ConfigureDataDictionary();
    }
}