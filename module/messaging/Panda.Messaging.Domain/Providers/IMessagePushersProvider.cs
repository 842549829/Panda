using Panda.Messaging.Domain.Shared.Enums;
using Panda.Messaging.Domain.Shared.Models;
using Volo.Abp.DependencyInjection;

namespace Panda.Messaging.Domain.Providers;

/// <summary>
/// 消息推送Provider
/// </summary>
public interface IMessagePushersProvider : ITransientDependency
{
    /// <summary>
    /// 消息服务编码  
    /// </summary>
    PushProviderCode Code { get; }

    /// <summary>
    /// 消息推送
    /// </summary>
    /// <param name="title">标题</param>
    /// <param name="content">内容</param>
    /// <param name="scopes">通知范围 key：providerName，value：providerKey</param>
    /// <param name="id">id 可空.</param>
    /// <param name="sendUserId">发送人Id 可空.</param>
    /// <param name="sendUserName">发送人姓名 可空.</param>
    /// <returns>标识一个异步</returns>
    Task PushersAsync(
        string title,
        string content,
        MessageScopeModel[] scopes,
        string? id = null,
        Guid? sendUserId = null,
        string? sendUserName = null);
}