using Microsoft.EntityFrameworkCore;
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


    protected override void OnModelCreating(ModelBuilder builder)
    {
        base.OnModelCreating(builder);

        builder.ConfigureDataDictionary();
    }
}