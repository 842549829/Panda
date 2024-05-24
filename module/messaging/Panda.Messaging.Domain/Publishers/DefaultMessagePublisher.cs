using Panda.Messaging.Domain.Entities;
using Panda.Messaging.Domain.Managers;
using Panda.Messaging.Domain.Pushers;
using Panda.Messaging.Domain.Shared.BackgroundJobArgs;
using Panda.Messaging.Domain.Shared.Models;
using Volo.Abp.BackgroundJobs;
using Volo.Abp.Data;

namespace Panda.Messaging.Domain.Publishers;

/// <summary>
/// 消息发布默认实现
/// </summary>
public class DefaultMessagePublisher : IMessagePublisher
{
    /// <summary>
    /// 消息推送接口
    /// </summary>
    private readonly IMessagePusher _messagePusher;

    /// <summary>
    /// 消息管理接口
    /// </summary>
    private readonly IMessageManager _messageManager;

    /// <summary>
    /// 后台任务仓储接口
    /// </summary>
    private readonly IBackgroundJobStore _backgroundJobStore;

    /// <summary>
    /// 后台任务管理接口
    /// </summary>
    private readonly IBackgroundJobManager _backgroundJobManager;

    public DefaultMessagePublisher(IMessagePusher messagePusher,
        IMessageManager messageManager,
        IBackgroundJobStore backgroundJobStore,
        IBackgroundJobManager backgroundJobManager)
    {
        _messagePusher = messagePusher;
        _messageManager = messageManager;
        _backgroundJobStore = backgroundJobStore;
        _backgroundJobManager = backgroundJobManager;
    }

    /// <summary>
    /// 消息发布
    /// </summary>
    /// <param name="message">消息</param>
    /// <returns>标识一个异步</returns>
    public Task PublishAsync(Message message)
    {
        return message.DelayedSend
            ? DelayPushAsync(message)
            : InstantPushAsync(message);
    }

    /// <summary>
    /// 消息及时推送
    /// </summary>
    /// <param name="message">消息</param>
    /// <returns>标识一个异步</returns>
    private async Task InstantPushAsync(Message message)
    {
        // 消息推送
        await _messagePusher.PusherAsync(message.Title,
            message.Content,
            message.Scopes.Select(MapToMessageScopeModel).ToArray(),
            message.PushProviderCode,
            message.Id.ToString(),
            message.SendUserId,
            message.SendUserName);

        // 标记消息为已发送
        message.MarkSent();

        await _messageManager.UpdateAsync(message);
    }

    /// <summary>
    /// 消息延时推送
    /// </summary>
    /// <param name="message">消息</param>
    /// <returns>标识一个异步</returns>
    private async Task DelayPushAsync(Message message)
    {
        var jobId = await _backgroundJobManager.EnqueueAsync(
            new MessagePushingArgs
            {
                Id = message.Id.ToString(),
                Title = message.Title,
                Content = message.Content,
                Scopes = message.Scopes.Select(MapToMessageScopeModel).ToArray(),
                ProviderCode = message.PushProviderCode
            }, delay: message.SendTime - DateTime.Now);

        // 添加后台工作Id，用于取消发送的标识
        message.SetProperty("DelayedSendJobIds", jobId);

        await _messageManager.UpdateAsync(message);
    }

    /// <summary>
    /// 消息撤回
    /// </summary>
    /// <param name="message">消息</param>
    /// <returns>标识一个异步</returns>
    public Task RecallAsync(Message message)
    {
        throw new NotImplementedException();
    }

    /// <summary>
    /// 对象转化
    /// </summary>
    /// <param name="messageScope">范围</param>
    /// <returns>范围模型</returns>
    private static MessageScopeModel MapToMessageScopeModel(MessageScope messageScope)
    {
        return new MessageScopeModel
        {
            ProviderName = messageScope.ProviderName,
            ProviderKey = messageScope.ProviderKey
        };
    }
}