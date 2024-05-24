using Panda.Messaging.Domain.Entities;
using Volo.Abp.Domain.Services;

namespace Panda.Messaging.Domain.Managers;

/// <summary>
/// 消息管理接口
/// </summary>
public interface IMessageManager : IDomainService
{
    /// <summary>
    /// 创建消息
    /// </summary>
    /// <param name="message">消息</param>
    /// <param name="cancellationToken">cancellationToken</param>
    /// <returns>返回消息</returns>
    Task<Message> CreateAsync(Message message, CancellationToken cancellationToken = default);

    /// <summary>
    /// 修改消息
    /// </summary>
    /// <param name="message">消息</param>
    /// <param name="cancellationToken">cancellationToken</param>
    /// <returns>返回消息</returns>
    Task<Message> UpdateAsync(Message message, CancellationToken cancellationToken = default);

    /// <summary>
    /// 查询消息
    /// </summary>
    /// <param name="id">id</param>
    /// <returns>消息</returns>
    Task<Message> GetAsync(Guid id);
}