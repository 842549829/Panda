using Microsoft.EntityFrameworkCore;
using Panda.File.EntityFrameworkCore.EntityFrameworkCore.Configs;
using Volo.Abp.Data;
using Volo.Abp.EntityFrameworkCore;

namespace Panda.File.EntityFrameworkCore.EntityFrameworkCore.DbContext;

/// <summary>
/// FileDbContext
/// </summary>
[ConnectionStringName(FileDbProperties.ConnectionStringName)]
public class FileDbContext : AbpDbContext<FileDbContext>, IFileDbContext
{
    public FileDbContext(DbContextOptions<FileDbContext> options) : base(options)
    {
    }
}