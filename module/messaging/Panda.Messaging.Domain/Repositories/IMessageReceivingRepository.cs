using Panda.Messaging.Domain.Entities;
using Panda.Messaging.Domain.Modules;
using Panda.Messaging.Domain.Shared.Enums;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Domain.Repositories;

namespace Panda.Messaging.Domain.Repositories;

public interface IMessageReceivingRepository : IRepository, ITransientDependency
{
    /// <summary>
    /// 查询-收到消息
    /// </summary>
    /// <param name="messageIds">消息Id集合</param>
    /// <param name="userId">用户Id</param>
    /// <param name="includeDetails">包含明细信息</param>
    /// <param name="cancellationToken">取消token</param>
    /// <returns></returns>
    Task<List<ReceivedMessage>> GetMessagesWithIdsAsync(
        Guid[] messageIds,
        Guid userId,
        bool includeDetails = true,
        CancellationToken cancellationToken = default);

    /// <summary>
    /// 查询-收到消息（包含收件信息）
    /// </summary>
    /// <param name="messageId">消息Id</param>
    /// <param name="userId">用户Id</param>
    /// <param name="includeDetails">包含明细信息</param>
    /// <param name="cancellationToken">取消token</param>
    /// <returns></returns>
    Task<ReceivedMessage> GetAsync(
        Guid messageId,
        Guid userId,
        bool includeDetails = true,
        CancellationToken cancellationToken = default);

    /// <summary>
    /// 查询-收到消息条数
    /// </summary>
    /// <param name="userId">用户Id</param>
    /// <param name="applicationName">所属系统名称（消息发起系统）</param>
    /// <param name="messageType">消息类型 1：通知，2：预警，99：其他 ...</param>
    /// <param name="title">消息标题</param>
    /// <param name="content">消息内容</param>
    /// <param name="sendTimeStart">发送时间-开始</param>
    /// <param name="sendTimeEnd">发送时间-结束</param>
    /// <param name="sendUserName">发送用户名</param>
    /// <param name="isRead">是否已读</param>
    /// <param name="tag">标签</param>
    /// <param name="cancellationToken">取消token</param>
    /// <returns></returns>
    Task<long> GetCountAsync(
        Guid userId,
        string? applicationName = null,
        MessageType? messageType = null,
        string? title = null,
        string? content = null,
        DateTime? sendTimeStart = null,
        DateTime? sendTimeEnd = null,
        string? sendUserName = null,
        bool? isRead = null,
        long? tag = null,
        CancellationToken cancellationToken = default);

    /// <summary>
    /// 查询-收到消息列表
    /// </summary>
    /// <param name="userId">用户Id</param>
    /// <param name="sorting">排序条件</param>
    /// <param name="maxResultCount">分页大小</param>
    /// <param name="skipCount">跳过条数</param>
    /// <param name="applicationName">所属系统名称（消息发起系统）</param>
    /// <param name="messageType">消息类型 1：通知，2：预警，99：其他 ...</param>
    /// <param name="title">消息标题</param>
    /// <param name="content">消息内容</param>
    /// <param name="sendTimeStart">发送时间-开始</param>
    /// <param name="sendTimeEnd">发送时间-结束</param>
    /// <param name="sendUserName">发送用户名</param>
    /// <param name="isRead">是否已读</param>
    /// <param name="tag">标签</param>
    /// <param name="includeDetails">包含明细信息</param>
    /// <param name="cancellationToken">取消token</param>
    /// <returns></returns>
    Task<List<ReceivedMessage>> GetListAsync(
        Guid userId,
        string? sorting = null,
        int maxResultCount = int.MaxValue,
        int skipCount = 0,
        string? applicationName = null,
        MessageType? messageType = null,
        string? title = null,
        string? content = null,
        DateTime? sendTimeStart = null,
        DateTime? sendTimeEnd = null,
        string? sendUserName = null,
        bool? isRead = null,
        long? tag = null,
        bool includeDetails = true,
        CancellationToken cancellationToken = default);

    /// <summary>
    /// 查询-未读消息条数
    /// </summary>
    /// <param name="userId">用户Id</param>
    /// <param name="cancellationToken">取消token</param>
    /// <returns></returns>
    Task<long> GetUnReadCountAsync(
        Guid userId,
        CancellationToken cancellationToken = default);

    /// <summary>
    /// 查询-未读消息列表
    /// </summary>
    /// <param name="userId">用户Id</param>
    /// <param name="includeDetails">是否包含明细</param>
    /// <param name="cancellationToken">取消token</param>
    /// <returns></returns>
    Task<List<Message>> GetUnReadListAsync(
        Guid userId,
        bool includeDetails = true,
        CancellationToken cancellationToken = default);
}