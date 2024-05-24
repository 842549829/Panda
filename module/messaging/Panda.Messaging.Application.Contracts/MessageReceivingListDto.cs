using Volo.Abp.Application.Dtos;

namespace Panda.Messaging.Application.Contracts;

public class MessageReceivingListDto : ExtensibleAuditedEntityDto<Guid>
{
    /// <summary>
    /// 所属系统名称（消息发起系统）
    /// </summary>
    public string ApplicationName { get; set; } = default!;

    /// <summary>
    /// 消息类型 1：通知，2：预警，99：其他 ...
    /// </summary>
    public int? MessageType { get; set; }

    /// <summary>
    /// 消息标题
    /// </summary>
    public string? Title { get; set; }

    /// <summary>
    /// 消息内容
    /// </summary>
    public string? Content { get; set; }

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
    public string? SendUserName { get; set; }

    /// <summary>
    /// 标签 二进制编码，用于扩展
    /// </summary>
    public string[]? Tag { get; set; }

    /// <summary>
    /// 已读状态 0：未读，1：已读
    /// </summary>
    public bool IsRead { get; set; }

    /// <summary>
    /// 查阅时间
    /// </summary>
    public DateTime? ReadTime { get; set; }
}