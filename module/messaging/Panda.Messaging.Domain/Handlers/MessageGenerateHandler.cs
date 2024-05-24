using Panda.Messaging.Domain.Factories;
using Panda.Messaging.Domain.Managers;
using Panda.Messaging.Domain.Publishers;
using Panda.Messaging.Domain.Shared.EventData;
using Volo.Abp.DependencyInjection;
using Volo.Abp.EventBus.Distributed;

namespace Panda.Messaging.Domain.Handlers;

/// <summary>
/// 创建消息消费时间处理
/// </summary>
public class MessageGenerateHandler : IDistributedEventHandler<MessageGenerateEto>, ITransientDependency
{
    /// <summary>
    /// 消息实体创建工厂接口
    /// </summary>
    private readonly IMessageFactory _messageFactory;

    /// <summary>
    /// 消息管理接口
    /// </summary>
    private readonly IMessageManager _messageManager;

    /// <summary>
    /// 消息发布接口
    /// </summary>
    private readonly IMessagePublisher _messagePublisher;
    

    public MessageGenerateHandler(IMessageFactory messageFactory,
        IMessageManager messageManager,
        IMessagePublisher messagePublisher)
    {
        _messageFactory = messageFactory;
        _messageManager = messageManager;
        _messagePublisher = messagePublisher;
    }

    /// <summary>
    ///处理程序通过实现此方法来处理事件
    /// </summary>
    /// <param name="eventData">事件数据</param>
    public async Task HandleEventAsync(MessageGenerateEto eventData)
    {
        var message = await _messageFactory.CreateAsync(eventData.ApplicationName,
            eventData.MessageType,
            eventData.PushProviderCode,
            eventData.Title,
            eventData.Content,
            eventData.DelayedSend,
            eventData.SendUserId,
            eventData.SendUserName,
            eventData.Scopes,
            eventData.MessageId,
            eventData.Tag,
            eventData.SendTime,
            eventData.ExpirationTime,
            eventData.ExtraProperties);

        message.SetCreatorId(eventData.SendUserId);

        await _messageManager.CreateAsync(message);

        await _messagePublisher.PublishAsync(message);

        //if (_unitOfWorkManager.Current != null)
        //{
        //    _unitOfWorkManager.Current.OnCompleted(async () =>
        //    {
        //        await _messagePublisher.PublishAsync(message);
        //    });
        //}
        //else
        //{
        //    await _messagePublisher.PublishAsync(message);
        //}
    }
}