namespace Panda.Messaging.Domain.Shared.Enums;

/// <summary>
/// 枚举：消息状态 1：已发布，2：已发送，3：已撤回
/// </summary>
public enum MessageStatus
{
    /// <summary>
    /// 已发布
    /// </summary>
    Published = 1,

    /// <summary>
    /// 已发送
    /// </summary>
    Sent = 2,

    /// <summary>
    /// 已撤回
    /// </summary>
    Recalled = 3
}