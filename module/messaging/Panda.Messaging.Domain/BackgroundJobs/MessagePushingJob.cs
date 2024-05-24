using Panda.Messaging.Domain.Managers;
using Panda.Messaging.Domain.Pushers;
using Panda.Messaging.Domain.Shared.BackgroundJobArgs;
using Panda.Messaging.Domain.Shared.Models;
using Volo.Abp.BackgroundJobs;
using Volo.Abp.DependencyInjection;

namespace Panda.Messaging.Domain.BackgroundJobs;

/// <summary>
/// 后台任务
/// </summary>
public class MessagePushingJob : AsyncBackgroundJob<MessagePushingArgs>, ITransientDependency
{
    /// <summary>
    /// 消息管理接口
    /// </summary>
    private readonly IMessageManager _messageManager;

    /// <summary>
    /// 消息推送接口
    /// </summary>
    private readonly IMessagePusher _messagePusher;

    /// <summary>
    /// 构造函数
    /// </summary>
    /// <param name="messageManager">消息管理接口</param>
    /// <param name="messagePusher">消息推送接口</param>
    public MessagePushingJob(IMessageManager messageManager, IMessagePusher messagePusher)
    {
        _messageManager = messageManager;
        _messagePusher = messagePusher;
    }

    /// <summary>
    /// Executes the job with the <paramref name="args" />.
    /// </summary>
    /// <param name="args">Job arguments.</param>
    public override async Task ExecuteAsync(MessagePushingArgs args)
    {
        var message = await _messageManager.GetAsync(Guid.Parse(args.Id));

        // 消息推送
        await _messagePusher.PusherAsync(message.Title, message.Content, message.Scopes.Select(ms =>
                new MessageScopeModel
                {
                    ProviderName = ms.ProviderName,
                    ProviderKey = ms.ProviderKey
                }).ToArray(), message.PushProviderCode, message.Id.ToString(),
            message.SendUserId, message.SendUserName);

        // 标记消息为已发送
        message.MarkSent();

        await _messageManager.UpdateAsync(message);
    }
}