using Panda.Messaging.Domain.Providers;
using Panda.Messaging.Domain.Shared.Enums;
using Panda.Messaging.Domain.Shared.Models;
using Panda.Net.Hubs;

namespace Panda.Net.MessageProviders.PushProviders;

/// <summary>
/// 系统消息
/// </summary>
public class SystemMessagePushersProvider : IMessagePushersProvider
{
    private readonly SystemMessageHub _systemMessageHub;

    public SystemMessagePushersProvider(SystemMessageHub systemMessageHub)
    {
        _systemMessageHub = systemMessageHub;
    }

    /// <summary>
    /// 消息服务编码  
    /// </summary>
    public PushProviderCode Code => PushProviderCode.System;

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
    public Task PushersAsync(string title, string content, MessageScopeModel[] scopes, string? id = null, Guid? sendUserId = null,
        string? sendUserName = null)
    {
        return _systemMessageHub.PushAsync(title, content, scopes, id, sendUserId, sendUserName);
    }
}