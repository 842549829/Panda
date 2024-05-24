using Panda.Messaging.Domain.Shared.Models;
using System.ComponentModel.DataAnnotations;

namespace Panda.Messaging.Domain.Shared.EventData;

public class MessagePushEto
{
    /// <summary>
    /// id
    /// </summary>
    [Required]
    public string Id { get; set; }

    /// <summary>
    /// 标题
    /// </summary>
    [Required]
    public string Title { get; set; }

    /// <summary>
    /// 内容
    /// </summary>
    [Required]
    public string Content { get; set; }

    /// <summary>
    /// 通知范围 key：providerName，value：providerKey
    /// </summary>
    [Required]
    public MessageScopeModel[] Scopes { get; set; }

    /// <summary>
    /// 关联推送提供商类型（1：系统消息，2：短信，4：典字邮件）
    /// </summary>
    [Required]
    public int ProviderCode { get; set; }

    /// <summary>
    /// 发送人Id
    /// </summary>
    [Required]
    public Guid SendUserId { get; set; }

    /// <summary>
    /// 发送人姓名
    /// </summary>
    [Required]
    public string SendUserName { get; set; }
}