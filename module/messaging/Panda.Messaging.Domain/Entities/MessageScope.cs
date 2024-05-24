using System.Collections.ObjectModel;
using Volo.Abp;
using Volo.Abp.Domain.Entities;

namespace Panda.Messaging.Domain.Entities;

/// <summary>
/// 消息范围
/// </summary>
public class MessageScope : Entity<Guid>
{
    /// <summary>
    /// 构造函数
    /// </summary>
    protected MessageScope()
    {
        Notifications = new Collection<MessageNotification>();
        ProviderName = string.Empty;
        ProviderKey = string.Empty;
    }

    /// <summary>
    /// 消息范围
    /// </summary>
    /// <param name="id">主键</param>
    /// <param name="messageId">消息Id</param>
    /// <param name="providerName">关联提供商类型（S：全局系统消息，A：系统，O：机构/部门，R：角色，G：群组，U：用户）</param>
    /// <param name="providerKey">关联提供商类型名称（S：All，A：Number，O：Number，D：Number，R：RoleName，G：Number，U：UserName）</param>
    protected internal MessageScope(
        Guid id,
        Guid messageId,
        string providerName,
        string providerKey)
        : base(id)
    {
        Check.NotNullOrWhiteSpace(providerName, nameof(providerName));

        MessageId = messageId;
        ProviderName = providerName;
        ProviderKey = providerKey;

        Notifications = new Collection<MessageNotification>();
    }

    /// <summary>
    /// 消息Id
    /// </summary>
    public Guid MessageId { get; private set; }

    /// <summary>
    /// 关联提供商类型（S：全局系统消息，A：系统，O：机构/部门，R：角色，G：群组，U：用户）
    /// </summary>
    public string ProviderName { get; private set; }

    /// <summary>
    /// 关联提供商类型名称（S：All，A：Number，O：Number，D：Number，R：RoleName，G：Number，U：UserName）
    /// </summary>
    public string ProviderKey { get; private set; }

    /// <summary>
    /// 消息通知
    /// </summary>
    public ICollection<MessageNotification> Notifications { get; private set; }

    /// <summary>
    /// 添加消息通知
    /// </summary>
    protected internal void AddNotificationIfNotContains(Guid id, Guid userId)
    {
        Notifications.AddIfNotContains(mn => mn.UserId == userId,
            () => new MessageNotification(id, userId, MessageId, Id));
    }
}