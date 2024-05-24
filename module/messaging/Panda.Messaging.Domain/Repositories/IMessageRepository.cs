using Panda.Messaging.Domain.Entities;
using Panda.Messaging.Domain.Shared.Enums;
using Volo.Abp.Domain.Repositories;

namespace Panda.Messaging.Domain.Repositories;

/// <summary>
/// 消息仓储接口
/// </summary>
public interface IMessageRepository : IRepository<Message, Guid>
{
    /// <summary>
    /// 查询-已读人数
    /// </summary>
    /// <param name="id">消息Id</param>
    /// <param name="userId">用户Id</param>
    /// <param name="cancellationToken">取消token</param>
    /// <returns>int</returns>
    Task<int> GetReaderCountAsync(Guid id,
        Guid userId,
        CancellationToken cancellationToken = default);

    /// <summary>
    /// 查询-消息列表
    /// </summary>
    /// <param name="messageIds">消息Id集合</param>
    /// <param name="includeDetails">包含明细信息</param>
    /// <param name="cancellationToken">取消token</param>
    /// <returns></returns>
    Task<List<Message>> GetWithMessageIdsAsync(
        Guid[] messageIds,
        bool includeDetails = true,
        CancellationToken cancellationToken = default);

    Task<long> GetCountAsync(
        string? applicationName = null,
        MessageType? messageType = null,
        PushProviderCode? pushProviderCode = null,
        string? title = null,
        string? content = null,
        bool? delayedSend = null,
        DateTime? sendTimeStart = null,
        DateTime? sendTimeEnd = null,
        string? sendUserName = null,
        MessageStatus? status = null,
        long? tag = null,
        CancellationToken cancellationToken = default);

    Task<List<Message>> GetListAsync(
        string? sorting = null,
        int maxResultCount = 10,
        int skipCount = 0,
        string? applicationName = null,
        MessageType? messageType = null,
        PushProviderCode? pushProviderCode = null,
        string? title = null,
        string? content = null,
        bool? delayedSend = null,
        DateTime? sendTimeStart = null,
        DateTime? sendTimeEnd = null,
        string? sendUserName = null,
        MessageStatus? status = null,
        long? tag = null,
        bool includeDetails = true,
        CancellationToken cancellationToken = default);
}