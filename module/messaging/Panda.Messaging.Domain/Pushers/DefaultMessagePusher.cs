using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using Panda.Messaging.Domain.Options;
using Panda.Messaging.Domain.Providers;
using Panda.Messaging.Domain.Shared.Enums;
using Panda.Messaging.Domain.Shared.Models;

namespace Panda.Messaging.Domain.Pushers;

/// <summary>
/// 消息推送默认实现
/// </summary>
public class DefaultMessagePusher : IMessagePusher
{
    /// <summary>
    /// 消息推送
    /// </summary>
    private readonly Lazy<List<IMessagePushersProvider>> _lazyProviders;

    /// <summary>
    /// 构造函数
    /// </summary>
    /// <param name="serviceProvider">serviceProvider</param>
    public DefaultMessagePusher(IServiceProvider serviceProvider)
    {
        var options = serviceProvider.GetRequiredService<IOptions<MessagingOptions>>();
        _lazyProviders = new Lazy<List<IMessagePushersProvider>>(
            () => options
                .Value
                .PushersProvider
                .Select(type => (IMessagePushersProvider)serviceProvider.GetRequiredService(type))
                .ToList(),
            true
        );
    }

    /// <summary>
    /// 消息推送
    /// </summary>
    protected virtual IReadOnlyList<IMessagePushersProvider> PushProviders => _lazyProviders.Value;

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
    public async Task PusherAsync(string title,
        string content, 
        MessageScopeModel[] scopes,
        PushProviderCode providerCode, 
        string? id = null,
        Guid? sendUserId = null,
        string? sendUserName = null)
    {
        foreach (var provider in PushProviders)
        {
            if ((providerCode & provider.Code) == provider.Code)
            {
                await provider.PushersAsync(title, content, scopes, id, sendUserId, sendUserName);
            }
        }
    }
}