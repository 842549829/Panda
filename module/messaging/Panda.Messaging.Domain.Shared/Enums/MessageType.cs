namespace Panda.Messaging.Domain.Shared.Enums;

/// <summary>
/// 消息类型
/// </summary>
[Flags]
public enum MessageType
{
    /// <summary>
    /// 通知
    /// </summary>
    Default = 1,

    /// <summary>
    /// 预警
    /// </summary>
    Warning = 2
}