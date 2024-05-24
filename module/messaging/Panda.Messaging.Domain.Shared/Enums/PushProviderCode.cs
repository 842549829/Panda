namespace Panda.Messaging.Domain.Shared.Enums;

/// <summary>
/// 消息消费者ProviderCode
/// </summary>
[Flags]
public enum PushProviderCode
{
    /// <summary>
    /// 系统消息
    /// </summary>
    System = 1,

    /// <summary>
    /// 短信消息
    /// </summary>
    Sms = 2,

    /// <summary>
    /// 邮件消息
    /// </summary>
    Email = 4,

    /// <summary>
    /// 微信消息 
    /// </summary>
    WeChat = 8,

    /// <summary>
    /// 支付宝生活号消息
    /// </summary>
    AliPay = 16,

    /// <summary>
    /// 其他自定义消息
    /// </summary>
    Other = 32
}