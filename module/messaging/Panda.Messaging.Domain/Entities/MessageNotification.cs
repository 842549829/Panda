using Volo.Abp.Domain.Entities;

namespace Panda.Messaging.Domain.Entities;

/// <summary>
/// 消息通知
/// </summary>
public class MessageNotification : Entity<Guid>
{
    /// <summary>
    /// 构造函数
    /// </summary>
    protected MessageNotification()
    {
    }

    /// <summary>
    /// 构造函数
    /// </summary>
    /// <param name="id">主键Id</param>
    /// <param name="userId">用户Id</param>
    /// <param name="messageId">消息Id</param>
    /// <param name="messageScopingId">消息范围Id</param>
    protected internal MessageNotification(Guid id, Guid userId, Guid messageId, Guid messageScopingId)
        : base(id)
    {
        UserId = userId;
        MessageId = messageId;
        MessageScopingId = messageScopingId;
    }

    /// <summary>
    /// 用户Id
    /// </summary>
    public Guid UserId { get; private set; }

    /// <summary>
    /// 消息Id
    /// </summary>
    public Guid MessageId { get; private set; }

    /// <summary>
    /// 消息范围Id
    /// </summary>
    public Guid MessageScopingId { get; private set; }

    /// <summary>
    /// 已读状态 0：未读，1：已读
    /// </summary>
    public bool IsRead { get; private set; }

    /// <summary>
    /// 查阅时间
    /// </summary>
    public DateTime? ReadTime { get; private set; }

    /// <summary>
    /// 标记已读
    /// </summary>
    protected internal void MarkRead()
    {
        IsRead = true;
        ReadTime = DateTime.Now;
    }
}