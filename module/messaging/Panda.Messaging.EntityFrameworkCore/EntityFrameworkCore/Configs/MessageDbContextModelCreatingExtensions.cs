using Microsoft.EntityFrameworkCore;
using Panda.Messaging.Domain.Entities;
using Panda.Messaging.Domain.Shared.Constants;
using Panda.Messaging.Domain.Shared.Enums;
using Volo.Abp;
using Volo.Abp.EntityFrameworkCore.Modeling;

namespace Panda.Messaging.EntityFrameworkCore.EntityFrameworkCore.Configs;

/// <summary>
/// 消息模型配置
/// </summary>
public static class MessageDbContextModelCreatingExtensions
{
    /// <summary>
    /// 消息模型配置
    /// </summary>
    /// <param name="builder">ModelBuilder</param>
    /// <param name="optionsAction">optionsAction</param>
    public static void ConfigureMessagingModel(
        this ModelBuilder builder,
        Action<MessageModelBuilderConfigurationOptions>? optionsAction = null)
    {
        Check.NotNull(builder, nameof(builder));

        var options = new MessageModelBuilderConfigurationOptions(
            MessageDbProperties.DbTablePrefix,
            MessageDbProperties.DbSchema
        );

        optionsAction?.Invoke(options);

        builder.Entity<MessageNotification>(b =>
        {
            b.ToTable(options.TablePrefix + "MessageNotifications", options.Schema);

            b.ConfigureByConvention();

            b.Property(mn => mn.UserId)
                .HasComment("用户Id")
                .IsRequired();
            b.Property(mn => mn.MessageId)
                .HasComment("消息Id")
                .IsRequired();
            b.Property(mn => mn.MessageScopingId)
                .HasComment("消息范围Id")
                .IsRequired();
            b.Property(mn => mn.IsRead)
                .HasComment("已读状态 0：未读，1：已读")
                .HasDefaultValue(false)
                .IsRequired();
            b.Property(mn => mn.ReadTime)
                .HasComment("查阅时间");

            b.HasIndex(mn => new { mn.UserId, mn.MessageScopingId, mn.MessageId, mn.IsRead });
        });

        builder.Entity<MessageScope>(b =>
        {
            b.ToTable(options.TablePrefix + "MessageScopes", options.Schema);

            b.ConfigureByConvention();

            b.Property(ms => ms.MessageId)
                .HasComment("消息Id")
                .IsRequired();
            b.Property(ms => ms.ProviderName)
                .HasComment("关联提供商类型（S：全局系统消息，A：系统，O：机构/部门，R：角色，G：群组，U：用户）")
                .IsRequired()
                .HasMaxLength(MessageScopingConstants.MaxProviderNameLength);
            b.Property(ms => ms.ProviderKey)
                .HasComment("关联提供商类型名称（S：All，A：Number，O：Number，D：Number，R：RoleName，G：Number，U：UserName）")
                .HasMaxLength(MessageScopingConstants.MaxProviderKeyLength);

            b.HasIndex(ms => new { ms.MessageId, ms.ProviderName, ms.ProviderKey });
        });

        builder.Entity<Message>(b =>
        {
            b.ToTable(options.TablePrefix + "Messages", options.Schema);

            b.ConfigureByConvention();

            b.Property(m => m.ApplicationName)
                .IsRequired()
                .HasComment("所属系统名称（消息发起系统）")
                .HasMaxLength(MessageConstants.MaxApplicationNameLength);
            b.Property(m => m.MessageType)
                .IsRequired()
                .HasComment("消息类型 1：通知，2：预警，99：其他 ...");
            b.Property(m => m.PushProviderCode)
                .HasComment("消息推送方式 1：系统消息，2：短信消息，4：邮件消息 ...")
                .IsRequired();
            b.Property(m => m.Title)
                .IsRequired()
                .HasComment("消息标题")
                .HasMaxLength(MessageConstants.MaxTitleLength);
            b.Property(m => m.Content)
                .IsRequired()
                .HasComment("消息内容")
                .HasMaxLength(MessageConstants.MaxContentLength);
            b.Property(m => m.DelayedSend)
                .IsRequired().HasDefaultValue(false)
                .HasComment("是否定时发送（延迟发送）0：否 1：是");
            b.Property(m => m.SendTime)
                .IsRequired()
                .HasComment("发送时间");
            b.Property(m => m.SendUserId)
                .IsRequired()
                .HasComment("发送人Id");
            b.Property(m => m.SendUserName)
                .IsRequired()
                .HasComment("发送人姓名")
                .HasMaxLength(MessageConstants.MaxSendUserNameLength);
            b.Property(m => m.ExpirationTime)
                .HasComment("到期时间（到期后收件人不可查看）");
            b.Property(m => m.RecalledTime)
                .HasComment("撤回时间");
            b.Property(m => m.RecalledUserId)
                .HasComment("撤回人Id");
            b.Property(m => m.RecalledUserName)
                .HasComment("撤回人Id")
                .HasMaxLength(MessageConstants.MaxRecalledUserNameLength);
            b.Property(m => m.Status)
                .IsRequired()
                .HasDefaultValue(MessageStatus.Published)
                .HasComment("消息状态 1：已发布，2：已发送，3：已撤回");
            b.Property(m => m.Tag)
                .HasComment("标签 二进制编码，用于扩展");

            b.HasIndex(m => new { m.ApplicationName, m.MessageType, m.Title });
        });
    }
}