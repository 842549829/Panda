using System.ComponentModel.DataAnnotations;
using Panda.Messaging.Domain.Shared.Enums;
using Panda.Messaging.Domain.Shared.Models;

namespace Panda.Messaging.Domain.Shared.BackgroundJobArgs;

/// <summary>
/// 消息任务
/// </summary>
public class MessagePushingArgs
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
    /// 关联提供商类型（1：系统消息，2：短信，4：典字邮件）
    /// </summary>
    [Required]
    public PushProviderCode ProviderCode { get; set; }

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