using Microsoft.EntityFrameworkCore;
using Panda.Messaging.Domain.Entities;
using Panda.Messaging.EntityFrameworkCore.EntityFrameworkCore.Configs;
using Volo.Abp.BackgroundJobs.EntityFrameworkCore;
using Volo.Abp.Data;
using Volo.Abp.EntityFrameworkCore;

namespace Panda.Messaging.EntityFrameworkCore.EntityFrameworkCore.DbContext;

[ConnectionStringName(MessageDbProperties.ConnectionStringName)]
public class MessageDbContext : AbpDbContext<MessageDbContext>, IMessageDbContext
{
    /* Add DbSet properties for your Aggregate Roots / Entities here. */

    public MessageDbContext(DbContextOptions<MessageDbContext> options)
        : base(options)
    {

    }

    protected override void OnModelCreating(ModelBuilder builder)
    {
        base.OnModelCreating(builder);

        builder.ConfigureBackgroundJobs();

        builder.ConfigureMessagingModel();
        builder.ConfigureMessagingModelRelation();
    }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        base.OnConfiguring(optionsBuilder);
#if DEBUG
        optionsBuilder.EnableSensitiveDataLogging(); //打印sql参数,测试有效
#endif
    }

    /// <summary>
    /// 消息
    /// </summary>
    public DbSet<Message> Messages { get; set; }
}
