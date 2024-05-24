using Microsoft.EntityFrameworkCore;
using Panda.Messaging.Domain.Entities;
using Panda.Messaging.EntityFrameworkCore.EntityFrameworkCore.Configs;
using Volo.Abp.Data;
using Volo.Abp.EntityFrameworkCore;

namespace Panda.Messaging.EntityFrameworkCore.EntityFrameworkCore.DbContext;

/// <summary>
/// 消息DbContext接口
/// </summary>
[ConnectionStringName(MessageDbProperties.ConnectionStringName)]
public interface IMessageDbContext : IEfCoreDbContext
{
    /// <summary>
    /// 消息
    /// </summary>
    DbSet<Message> Messages { get; set; }
}