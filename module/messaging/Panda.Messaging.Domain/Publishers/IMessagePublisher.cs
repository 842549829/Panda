using Volo.Abp.DependencyInjection;

namespace Panda.Messaging.Domain.Publishers;

/// <summary>
/// 消息发布接口
/// </summary>
public interface IMessagePublisher : ITransientDependency
{
    /// <summary>
    /// 消息发布
    /// </summary>
    /// <param name="message">消息</param>
    /// <returns>标识一个异步</returns>
    Task PublishAsync(Entities.Message message);

    /// <summary>
    /// 消息撤回
    /// </summary>
    /// <param name="message">消息</param>
    /// <returns>标识一个异步</returns>
    Task RecallAsync(Entities.Message message);
}