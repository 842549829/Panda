using Microsoft.EntityFrameworkCore;
using Panda.DataDictionary.Domain.DataDictionaries;
using Panda.DataDictionary.Domain.DataDictionaries.Entities;
using Volo.Abp.Data;
using Volo.Abp.EntityFrameworkCore;

namespace Panda.DataDictionary.EntityFrameworkCore.DbContext;

[ConnectionStringName(DataDictionaryDbProperties.ConnectionStringName)]
public interface IDataDictionaryDbContext : IEfCoreDbContext
{
    public DbSet<DictCategory> DictCategories { get; set; } 

    public DbSet<DictItem> DictItem { get; set; } 
}