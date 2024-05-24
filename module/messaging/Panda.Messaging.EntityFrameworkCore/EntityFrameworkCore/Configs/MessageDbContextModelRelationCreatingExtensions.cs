using Microsoft.EntityFrameworkCore;
using Panda.Messaging.Domain.Entities;
using Volo.Abp;

namespace Panda.Messaging.EntityFrameworkCore.EntityFrameworkCore.Configs;

/// <summary>
/// 消息模型关系配置
/// </summary>
public static class MessageDbContextModelRelationCreatingExtensions
{
    /// <summary>
    /// 消息模型关系配置
    /// </summary>
    /// <param name="builder">ModelBuilder</param>
    public static void ConfigureMessagingModelRelation(
        this ModelBuilder builder)
    {
        Check.NotNull(builder, nameof(builder));

        builder.Entity<MessageNotification>(_ =>
        {
        });

        builder.Entity<MessageScope>(b =>
        {
            b.HasMany(ms => ms.Notifications)
                .WithOne()
                .HasForeignKey(mn => mn.MessageScopingId)
                .IsRequired()
                .OnDelete(DeleteBehavior.Cascade);
        });

        builder.Entity<Message>(b =>
        {
            b.HasMany(m => m.Scopes)
                .WithOne()
                .HasForeignKey(ms => ms.MessageId)
                .IsRequired()
                .OnDelete(DeleteBehavior.Cascade);

            b.HasMany(m => m.Notifications)
                .WithOne()
                .HasForeignKey(mn => mn.MessageId)
                .IsRequired()
                .OnDelete(DeleteBehavior.Cascade);
        });
    }
}