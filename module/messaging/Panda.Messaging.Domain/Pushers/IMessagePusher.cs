using Panda.Messaging.Domain.Shared.Enums;
using Panda.Messaging.Domain.Shared.Models;
using Volo.Abp.DependencyInjection;

namespace Panda.Messaging.Domain.Pushers;

/// <summary>
/// 消息推送
/// </summary>
public interface IMessagePusher : ITransientDependency
{
    /// <summary>
    /// 消息推送
    /// </summary>
    /// <param name="title">标题</param>
    /// <param name="content">内容</param>
    /// <param name="scopes">通知范围 key：providerName，value：providerKey</param>
    /// <param name="providerCode">关联推送提供商类型（1：系统消息，2：短信，4：典字邮件）</param>
    /// <param name="id">id 可空.</param>
    /// <param name="sendUserId">发送人Id 可空.</param>
    /// <param name="sendUserName">发送人姓名 可空.</param>
    /// <returns>标识一个异步</returns>
    Task PusherAsync(
        string title,
        string content,
        MessageScopeModel[] scopes,
        PushProviderCode providerCode,
        string? id = null,
        Guid? sendUserId = null,
        string? sendUserName = null);
}