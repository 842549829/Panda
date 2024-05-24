using Panda.File.EntityFrameworkCore.EntityFrameworkCore.Configs;
using Volo.Abp.Data;
using Volo.Abp.EntityFrameworkCore;

namespace Panda.File.EntityFrameworkCore.EntityFrameworkCore.DbContext;

/// <summary>
/// FileDbContext接口
/// </summary>
[ConnectionStringName(FileDbProperties.ConnectionStringName)]
public interface IFileDbContext : IEfCoreDbContext;