using Panda.Messaging.Domain.Shared.Enums;
using Volo.Abp.Application.Dtos;

namespace Panda.Messaging.Application.Contracts;

/// <summary>
/// 数据模型：消息
/// </summary>
public class MessageDto : ExtensibleAuditedEntityDto<Guid>
{
    public MessageDto()
    {
        Scopes = new List<MessageScopeDto>();
    }

    /// <summary>
    /// 所属系统名称（消息发起系统）
    /// </summary>
    public string ApplicationName { get; set; }

    /// <summary>
    /// 消息类型 1：通知，2：预警，99：其他 ...
    /// </summary>
    public int MessageType { get; set; }

    /// <summary>
    /// 消息推送方式 1：系统消息，2：短信消息，4：邮件消息
    /// </summary>
    public int[] PushProviderCode { get; set; }

    /// <summary>
    /// 消息标题
    /// </summary>
    public string Title { get; set; }

    /// <summary>
    /// 消息内容
    /// </summary>
    public string Content { get; set; }

    /// <summary>
    /// 是否定时发送（延迟发送）0：否 1：是
    /// </summary>
    public bool DelayedSend { get; set; }

    /// <summary>
    /// 发送时间
    /// </summary>
    public DateTime? SendTime { get; set; }

    /// <summary>
    /// 发送人Id
    /// </summary>
    public Guid? SendUserId { get; set; }

    /// <summary>
    /// 发送人姓名
    /// </summary>
    public string SendUserName { get; set; }

    /// <summary>
    /// 撤回人Id
    /// </summary>
    public Guid? RecalledUserId { get; set; }

    /// <summary>
    /// 撤回人Id
    /// </summary>
    public string RecalledUserName { get; set; }

    /// <summary>
    /// 撤回时间
    /// </summary>
    public DateTime? RecalledTime { get; set; }

    /// <summary>
    /// 消息状态
    /// </summary>
    public MessageStatus Status { get; set; }

    /// <summary>
    /// 标签 二进制编码，用于扩展
    /// </summary>
    public string[] Tag { get; set; }

    /// <summary>
    /// 已读人数
    /// </summary>
    public int ReadCount { get; set; }

    /// <summary>
    /// 通知范围 key：providerName，value：providerKey
    /// </summary>
    public List<MessageScopeDto> Scopes { get; set; }
}