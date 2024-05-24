using Panda.Messaging.Domain.Shared.Enums;
using Volo.Abp.Application.Dtos;

namespace Panda.Messaging.Application.Contracts;

public class GetSentMessagesInputDto : PagedAndSortedResultRequestDto
{
    /// <summary>
    /// 所属系统名称（消息发起系统）
    /// </summary>
    public string ApplicationName { get; set; }

    /// <summary>
    /// 消息类型 1：通知，2：预警，99：其他 ...
    /// </summary>
    public MessageType? MessageType { get; set; }

    /// <summary>
    /// 消息推送方式 1：系统消息，2：短信消息，4：邮件消息
    /// </summary>
    public PushProviderCode? PushProviderCode { get; set; }

    /// <summary>
    /// 接收类型（S：全局系统消息，A：系统，O：机构/部门，R：角色，G：群组，U：用户）
    /// </summary>
    public string ProviderName { get; set; }

    /// <summary>
    /// 接收类型名称（S：Null，A：Number，O：Number，D：Number，R：RoleName，G：Number，U：UserName）
    /// </summary>
    public string ProviderKey { get; set; }

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
    public bool? DelayedSend { get; set; }

    /// <summary>
    /// 发送时间-开始
    /// </summary>
    public DateTime? SendTimeStart { get; set; }

    /// <summary>
    /// 发送时间-结束
    /// </summary>
    public DateTime? SendTimeEnd { get; set; }

    /// <summary>
    /// 消息状态
    /// </summary>
    public MessageStatus? Status { get; set; }

    /// <summary>
    /// 收信人Id
    /// </summary>
    public Guid? ReceiverId { get; set; }

    /// <summary>
    /// 标签 二进制编码，用于扩展
    /// </summary>
    public string[] Tag { get; set; }
}