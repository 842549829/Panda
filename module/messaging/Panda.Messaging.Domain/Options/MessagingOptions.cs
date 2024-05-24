using Panda.Messaging.Domain.Providers;
using Volo.Abp.Collections;

namespace Panda.Messaging.Domain.Options;

/// <summary>
/// 消息配置
/// </summary>
public class MessagingOptions
{
    /// <summary>
    /// 构造函数
    /// </summary>
    public MessagingOptions()
    {
        PushersProvider = new TypeList<IMessagePushersProvider>();
        PublishProviders = new TypeList<IMessagePublishProvider>();
    }

    /// <summary>
    /// 消息推送提供者(推送哪些消息)
    /// </summary>
    public ITypeList<IMessagePushersProvider> PushersProvider { get; }

    /// <summary>
    /// 消息发布提供者(根据消息推送范围确定具体接收者有哪些)
    /// </summary>
    public ITypeList<IMessagePublishProvider> PublishProviders { get; }
}