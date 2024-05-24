using System.Collections.ObjectModel;
using System.ComponentModel.DataAnnotations.Schema;
using Panda.Messaging.Domain.Shared.Constants;
using Panda.Messaging.Domain.Shared.Enums;
using Volo.Abp;
using Volo.Abp.Data;
using Volo.Abp.Domain.Entities.Auditing;

namespace Panda.Messaging.Domain.Entities;

/// <summary>
/// 消息
/// </summary>
public sealed class Message : FullAuditedAggregateRoot<Guid>
{
    /// <summary>
    /// 构造函数 EF使用
    /// </summary>
    protected Message()
    {
        Scopes = new Collection<MessageScope>();
        Notifications = new Collection<MessageNotification>();
        ExtraProperties = new ExtraPropertyDictionary();
    }

    /// <summary>
    /// 创建消息
    /// </summary>
    /// <param name="id">id</param>
    /// <param name="applicationName">所属系统名称（消息发起系统）</param>
    /// <param name="messageType">消息类型 1：通知，2：预警 ...</param>
    /// <param name="pushProviderCode">消息推送方式 1：系统消息，2：短信消息，4：邮件消息</param>
    /// <param name="title">标题</param>
    /// <param name="content">内容</param>
    /// <param name="delayedSend">是否定时发送（延迟发送）0：否 1：是</param>
    /// <param name="sendUserId">发送人Id</param>
    /// <param name="sendUserName">发送人名称</param>
    /// <param name="tag">标签 二进制编码，用于扩展</param>
    /// <param name="sendTime">发送时间（及时发送则为创建时间）空则为及时发送</param>
    /// <param name="expirationTime">到期时间（到期后收件人不可查看）</param>
    /// <param name="extraProperties">扩展信息</param>
    internal Message(
        Guid id,
        string applicationName,
        MessageType messageType,
        PushProviderCode pushProviderCode,
        string title,
        string content,
        bool delayedSend,
        Guid sendUserId,
        string sendUserName,
        long? tag = null,
        DateTime? sendTime = null,
        DateTime? expirationTime = null,
        ExtraPropertyDictionary? extraProperties = null) : base(id)
    {
        Check.NotNullOrWhiteSpace(applicationName, nameof(applicationName), MessageConstants.MaxApplicationNameLength);
        Check.NotNullOrWhiteSpace(title, nameof(title), MessageConstants.MaxTitleLength);
        Check.NotNullOrWhiteSpace(content, nameof(content), MessageConstants.MaxContentLength);
        Check.NotNullOrWhiteSpace(sendUserName, nameof(sendUserName), MessageConstants.MaxSendUserNameLength);

        ApplicationName = applicationName;
        MessageType = messageType;
        Title = title;
        Content = content;
        Tag = tag;
        PushProviderCode = pushProviderCode;
        DelayedSend = delayedSend;
        SendUserId = sendUserId;
        SendUserName = sendUserName;
        Status = MessageStatus.Published;
        SendTime = DateTime.Now;

        // 延迟发送
        if (delayedSend)
        {
            // 发送时间不能为空
            if (sendTime == null)
            {
                throw new UserFriendlyException("定时发送,必须指定消息发送时间.", "Messaging.SendTimeNull");
            }

            if (!IsValidDelaySendTime(sendTime.Value))
            {
                throw new UserFriendlyException("定时发送,消息发送时间必须在当前时间两分钟之后.", "Messaging.SendTimeNotValid");
            }

            SendTime = sendTime.Value;
        }

        if (expirationTime.HasValue && expirationTime.Value <= DateTime.Now)
        {
            throw new UserFriendlyException("消息过期时间必须在当前时间之后.", "Messaging.ExpirationTimeNotValid");
        }

        ExpirationTime = expirationTime;

        Scopes = new Collection<MessageScope>();
        Notifications = new Collection<MessageNotification>();
        ExtraProperties = extraProperties ?? new ExtraPropertyDictionary();
    }

    /// <summary>
    /// 所属系统名称（消息发起系统）
    /// </summary>
    public string ApplicationName { get; private set; }

    /// <summary>
    /// 消息类型 1：通知，2：预警，99：其他 ...
    /// </summary>
    public MessageType MessageType { get; private set; }

    /// <summary>
    /// 消息推送方式 1：系统消息，2：短信消息，4：邮件消息
    /// </summary>
    public PushProviderCode PushProviderCode { get; private set; }

    /// <summary>
    /// 消息标题
    /// </summary>
    public string Title { get; private set; }

    /// <summary>
    /// 消息内容
    /// </summary>
    public string Content { get; private set; }

    /// <summary>
    /// 是否定时发送（延迟发送）0：否 1：是
    /// </summary>
    public bool DelayedSend { get; private set; }

    /// <summary>
    /// 发送时间
    /// </summary>
    public DateTime SendTime { get; private set; }

    /// <summary>
    /// 发送人Id
    /// </summary>
    public Guid SendUserId { get; private set; }

    /// <summary>
    /// 发送人姓名
    /// </summary>
    public string SendUserName { get; private set; }

    /// <summary>
    /// 到期时间（到期后收件人不可查看）
    /// </summary>
    public DateTime? ExpirationTime { get; private set; }

    /// <summary>
    /// 撤回人Id
    /// </summary>
    public Guid? RecalledUserId { get; private set; }

    /// <summary>
    /// 撤回人名称
    /// </summary>
    public string? RecalledUserName { get; private set; }

    /// <summary>
    /// 撤回时间
    /// </summary>
    public DateTime? RecalledTime { get; private set; }

    /// <summary>
    /// 消息状态 1：已发布，2：已发送，3：已撤回
    /// </summary>
    public MessageStatus Status { get; private set; }

    /// <summary>
    /// 标签 二进制编码，用于扩展
    /// </summary>
    public long? Tag { get; private set; }

    /// <summary>
    /// 通知范围
    /// </summary>
    public ICollection<MessageScope> Scopes { get; private set; }

    /// <summary>
    /// 消息通知
    /// </summary>
    public ICollection<MessageNotification> Notifications { get; private set; }

    /// <summary>
    /// 已读人数
    /// </summary>
    /// <returns></returns>
    [NotMapped]
    public int ReadCount => Notifications.Count(mn => mn.IsRead);

    /// <summary>
    /// 用户是否已读
    /// </summary>
    /// <param name="userId">用户Id</param>
    /// <returns>是否已读</returns>
    public bool IsRead(Guid userId)
    {
        return Notifications.Any(mn => mn.UserId == userId && mn.IsRead);
    }

    /// <summary>
    /// 添加通知范围
    /// </summary>
    /// <param name="id">主键Id</param>
    /// <param name="providerName">关联提供商类型（S：全局系统消息，A：系统，O：机构/部门，R：角色，G：群组，U：用户）</param>
    /// <param name="providerKey">关联提供商类型名称（S：All，A：Number，O：Number，D：Number，R：RoleName，G：Number，U：UserName）</param>
    /// <exception cref="UserFriendlyException">当前消息已存在通知范围异常</exception>
    public MessageScope AddScope(Guid id,
        string providerName,
        string providerKey)
    {
        if (IsScopeExists(providerName, providerKey))
        {
            throw new UserFriendlyException($"当前消息已存在通知范围{providerName}:{providerKey}.");
        }

        var scope = new MessageScope(id, Id, providerName, providerKey);

        Scopes.Add(scope);

        return scope;
    }

    /// <summary>
    /// 通知范围是否已存在
    /// </summary>
    /// <param name="providerName">关联提供商类型（S：全局系统消息，A：系统，O：机构/部门，R：角色，G：群组，U：用户）</param>
    /// <param name="providerKey">关联提供商类型名称（S：All，A：Number，O：Number，D：Number，R：RoleName，G：Number，U：UserName）</param>
    /// <returns>通知范围是否已存在</returns>
    private bool IsScopeExists(string providerName,
        string? providerKey)
    {
        return Scopes.Any(ms => ms.ProviderName == providerName && ms.ProviderKey == providerKey);
    }

    /// <summary>
    /// 是否有效的延时发送时间
    /// </summary>
    /// <param name="sendTime">发生时间</param>
    /// <returns>是否有效的延时发送时间</returns>
    private static bool IsValidDelaySendTime(DateTime sendTime)
    {
        return sendTime >= DateTime.Now.AddMinutes(2);
    }

    /// <summary>
    /// 标记已读
    /// </summary>
    /// <param name="userId">用户Id</param>
    public void MarkRead(Guid userId)
    {
        // 用户已读
        if (IsRead(userId))
        {
            return;
        }

        // 只有发送的消息可以标记已读
        if (Status != MessageStatus.Sent)
        {
            throw new UserFriendlyException("当前消息状态无法标记已读!", "Messaging.IncorrectState");
        }

        // 不在通知范围内
        if (!IsInNotification(userId))
        {
            throw new UserFriendlyException("用户不在通知范围内无法标记已读!", "Messaging.UserNotInNotification");
        }

        // 非系统消息的普通的通知范围内
        if (IsInNormalNotification(userId))
        {
            var notifications = Notifications
                .Where(mn => mn.UserId == userId && !mn.IsRead)
                .ToList();

            if (notifications.IsNullOrEmpty())
            {
                return;
            }

            // 标记为已读
            foreach (var notification in notifications)
            {
                notification.MarkRead();
            }
        }
        else
        {
            // 直接添加已读的通知记录
            var systemScope = Scopes.First(ms =>
                ms.ProviderName == MessageScopingConstants.MessageScopingProviderName.System);

            var notification = new MessageNotification(Guid.NewGuid(), userId, Id, systemScope.Id);

            notification.MarkRead();

            Notifications.Add(notification);
        }
    }

    /// <summary>
    /// 标记消息为已发送
    /// </summary>
    public void MarkSent()
    {
        if (Status != MessageStatus.Published)
        {
            throw new UserFriendlyException("当前消息状态无法发送!", "Messaging.IncorrectState");
        }

        Status = MessageStatus.Sent;
    }

    /// <summary>
    /// 设置创建用户Id
    /// </summary>
    /// <param name="creatorId">创建用户Id</param>
    public void SetCreatorId(Guid creatorId)
    {
        CreatorId = creatorId;
    }

    /// <summary>
    /// 撤回消息
    /// </summary>
    /// <param name="recalledUserId">撤回人Id</param>
    /// <param name="recalledUserName">撤回人姓名</param>
    public void Recall(
        Guid recalledUserId,
        string recalledUserName)
    {
        Check.NotNullOrWhiteSpace(recalledUserName, nameof(recalledUserName),
            MessageConstants.MaxRecalledUserNameLength);

        if (Status == MessageStatus.Recalled)
        {
            throw new UserFriendlyException("当前消息状态无法撤回!", "Messaging.IncorrectState");
        }

        Status = MessageStatus.Recalled;
        RecalledUserId = recalledUserId;
        RecalledUserName = recalledUserName;
        RecalledTime = DateTime.Now;

        Scopes.Clear();
        Notifications.Clear();
    }

    /// <summary>
    /// 获取指定通知范围
    /// </summary>
    /// <param name="providerName">关联提供商类型（S：全局系统消息，A：系统，O：机构/部门，R：角色，G：群组，U：用户）</param>
    /// <param name="providerKey">关联提供商类型名称（S：All，A：Number，O：Number，D：Number，R：RoleName，G：Number，U：UserName）</param>
    /// <returns></returns>
    public MessageScope GetScope(string providerName,
        string providerKey)
    {
        var scope = Scopes.First(ms =>
            ms.ProviderName == providerName && ms.ProviderKey == providerKey);
        return scope;
    }

    /// <summary>
    /// 是否在通知范围内
    /// </summary>
    /// <param name="userId">用户Id</param>
    /// <returns>是否在通知范围内</returns>
    public bool IsInNotification(Guid userId)
    {
        return IsSystemMessage || IsInNormalNotification(userId);
    }

    /// <summary>
    /// 用户是否在普通通知范围内
    /// </summary>
    /// <param name="userId">用户Id</param>
    /// <returns>用户是否在普通通知范围内</returns>
    public bool IsInNormalNotification(Guid userId)
    {
        return Notifications.Any(mn => mn.UserId == userId);
    }

    /// <summary>
    /// 是否为全局消息
    /// </summary>
    public bool IsSystemMessage => Scopes.Any(ms =>
        ms.ProviderName == MessageScopingConstants.MessageScopingProviderName.System);
}