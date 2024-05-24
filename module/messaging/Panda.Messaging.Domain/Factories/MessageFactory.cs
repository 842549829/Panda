using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using Panda.Messaging.Domain.Entities;
using Panda.Messaging.Domain.Options;
using Panda.Messaging.Domain.Providers;
using Panda.Messaging.Domain.Shared.Enums;
using Panda.Messaging.Domain.Shared.Models;
using Volo.Abp;
using Volo.Abp.Data;
using Volo.Abp.Guids;

namespace Panda.Messaging.Domain.Factories;

/// <summary>
/// 消息创建工厂
/// </summary>
public class MessageFactory : IMessageFactory
{
    /// <summary>
    /// 消息发布者Provider
    /// </summary>
    private readonly Lazy<List<IMessagePublishProvider>> _lazyProviders;

    /// <summary>
    /// serviceProvider
    /// </summary>
    private readonly IServiceProvider _serviceProvider;

    /// <summary>
    /// 构造函数
    /// </summary>
    /// <param name="serviceProvider">serviceProvider</param>
    public MessageFactory(IServiceProvider serviceProvider)
    {
        _serviceProvider = serviceProvider;
        var options = _serviceProvider.GetRequiredService<IOptions<MessagingOptions>>();

        _lazyProviders = new Lazy<List<IMessagePublishProvider>>(
            () => options.Value
                .PublishProviders
                .Select(c => (IMessagePublishProvider)serviceProvider.GetRequiredService(c))
                .ToList(),
            true
        );
    }

    /// <summary>
    /// 消息发布者
    /// </summary>
    protected virtual IReadOnlyList<IMessagePublishProvider> PublishProviders => _lazyProviders.Value;
        
    /// <summary>
    /// 创建消息
    /// </summary>
    /// <param name="applicationName">所属系统名称（消息发起系统）</param>
    /// <param name="messageType">消息类型 1：通知，2：预警</param>
    /// <param name="pushProviderCode">消息推送方式 1：系统消息，2：短信消息，4：邮件消息</param>
    /// <param name="title">标题</param>
    /// <param name="content">内容</param>
    /// <param name="delayedSend">是否定时发送（延迟发送）0：否 1：是</param>
    /// <param name="sendUserId">发送人Id</param>
    /// <param name="sendUserName">发送人名称</param>
    /// <param name="scopes">通知范围 key：providerName，value：providerKey</param>
    /// <param name="id">Id</param>
    /// <param name="tag">标签 二进制编码，用于扩展</param>
    /// <param name="sendTime">发送时间（及时发送则为创建时间）空则为及时发送</param>
    /// <param name="expirationTime">到期时间（到期后收件人不可查看）</param>
    /// <param name="extraProperties">扩展信息</param>
    public async Task<Message> CreateAsync(string applicationName, 
        MessageType messageType,
        PushProviderCode pushProviderCode,
        string title,
        string content, 
        bool delayedSend, 
        Guid sendUserId,
        string sendUserName, 
        MessageScopeModel[] scopes,
        Guid? id = null,
        long? tag = null,
        DateTime? sendTime = null,
        DateTime? expirationTime = null,
        ExtraPropertyDictionary? extraProperties = null)
    {
        Check.NotNull(scopes, nameof(scopes));

        var guidGenerator = _serviceProvider.GetRequiredService<IGuidGenerator>();

        var message = new Message(id ?? guidGenerator.Create(),
            applicationName,
            messageType,
            pushProviderCode,
            title,
            content,
            delayedSend,
            sendUserId,
            sendUserName,
            tag,
            sendTime,
            expirationTime,
            extraProperties);

        await SetScopesAsync(message, scopes);

        return message;
    }

    /// <summary>
    /// 设置消息范围
    /// </summary>
    /// <param name="message">消息</param>
    /// <param name="scopes">范围</param>
    /// <returns>标识一个异步方法</returns>
    private async Task SetScopesAsync(Message message, MessageScopeModel[] scopes)
    {
        if (PublishProviders == null || !PublishProviders.Any())
        {
            throw new UserFriendlyException("未知消息发布提供程序");
        }
        var guidGenerator = _serviceProvider.GetRequiredService<IGuidGenerator>();
        foreach (var scope in scopes)
        {
            if (scope.ProviderName == null)
            {
                throw new UserFriendlyException("关联提供商类型不可为空");
            }
            if (scope.ProviderKey == null)
            {
                throw new UserFriendlyException("关联提供商类型名称不可为空");
            }
            var provider = PublishProviders.FirstOrDefault(m => m.ProviderName == scope.ProviderName);
            if (provider == null)
            {
                throw new UserFriendlyException("Unknown message publish provider: " + scope.ProviderName);
            }
            var messageScope = message.AddScope(guidGenerator.Create(), scope.ProviderName, scope.ProviderKey);
            var userIds = await provider.GetNotifyingUsers(scope.ProviderKey);
            if (userIds.IsNullOrEmpty())
            {
                continue;
            }
            foreach (var userId in userIds)
            {
                messageScope.AddNotificationIfNotContains(guidGenerator.Create(), userId);
            }
        }
    }
}