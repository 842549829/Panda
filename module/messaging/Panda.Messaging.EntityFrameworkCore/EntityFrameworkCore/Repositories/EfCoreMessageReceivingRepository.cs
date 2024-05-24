using Microsoft.EntityFrameworkCore;
using Panda.Messaging.Domain.Entities;
using Panda.Messaging.Domain.Modules;
using Panda.Messaging.Domain.Repositories;
using Panda.Messaging.Domain.Shared.Constants;
using Panda.Messaging.Domain.Shared.Enums;
using Panda.Messaging.EntityFrameworkCore.EntityFrameworkCore.DbContext;
using System.Linq.Dynamic.Core;
using System.Linq.Expressions;
using Volo.Abp.Domain.Repositories.EntityFrameworkCore;
using Volo.Abp.EntityFrameworkCore;

namespace Panda.Messaging.EntityFrameworkCore.EntityFrameworkCore.Repositories;

/// <summary>
/// 仓储：消息接收
/// </summary>
public class EfCoreMessageReceivingRepository :
    EfCoreRepository<IMessageDbContext, Message, Guid>,
    IMessageReceivingRepository
{
    public EfCoreMessageReceivingRepository(IDbContextProvider<IMessageDbContext> dbContextProvider)
        : base(dbContextProvider)
    {
    }

    public override async Task<IQueryable<Message>> WithDetailsAsync()
    {
        var query = await GetQueryableAsync();
        return query.IncludeDetails();
    }

    /// <summary>
    /// 查询-收到消息（包含收件信息）
    /// </summary>
    /// <param name="messageId">消息Id</param>
    /// <param name="userId">用户Id</param>
    /// <param name="includeDetails">包含明细信息</param>
    /// <param name="cancellationToken">取消token</param>
    /// <returns></returns>
    public virtual async Task<ReceivedMessage> GetAsync(
        Guid messageId,
        Guid userId,
        bool includeDetails = true,
        CancellationToken cancellationToken = default)
    {
        var message = await GetAsync(m =>
            m.Id == messageId
            && (!m.ExpirationTime.HasValue || m.ExpirationTime.Value >= DateTime.Now)
            && m.Status == MessageStatus.Sent
            && (m.Scopes.Any(ms => ms.ProviderName == MessageScopingConstants.MessageScopingProviderName.System)
                || m.Notifications.Any(mn => mn.UserId == userId)), includeDetails, cancellationToken);

        return MapToReceivedMessage(message, userId);
    }

    /// <summary>
    /// 查询-收到消息
    /// </summary>
    /// <param name="messageIds">消息Id集合</param>
    /// <param name="userId">用户Id</param>
    /// <param name="includeDetails">包含明细信息</param>
    /// <param name="cancellationToken">取消token</param>
    /// <returns></returns>
    public virtual async Task<List<ReceivedMessage>> GetMessagesWithIdsAsync(
        Guid[] messageIds,
        Guid userId,
        bool includeDetails = true,
        CancellationToken cancellationToken = default)
    {
        var query = (await GetQueryableAsync(userId, includeDetails: includeDetails))
            .Where(rm => messageIds.Contains(rm.Message.Id));

        query = query
            .OrderBy(um => um.IsRead)
            .ThenByDescending(um => um.Message.SendTime);

        return await query.ToListAsync(cancellationToken);
    }

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
    public virtual async Task<long> GetCountAsync(
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
        CancellationToken cancellationToken = default)
    {
        var query = await GetQueryableAsync(userId, applicationName, messageType, title, content, sendTimeStart,
            sendTimeEnd, sendUserName, isRead, tag, false);

        return await query.LongCountAsync(GetCancellationToken(cancellationToken));
    }

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
    public virtual async Task<List<ReceivedMessage>> GetListAsync(
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
        CancellationToken cancellationToken = default)
    {
        var query = await GetQueryableAsync(userId, applicationName, messageType, title, content, sendTimeStart,
            sendTimeEnd, sendUserName, isRead, tag, includeDetails);

        query = sorting.IsNullOrWhiteSpace()
            ? query
                .OrderBy(um => um.IsRead)
                .ThenByDescending(um => um.Message.SendTime)
            : query.OrderBy(sorting);

        return await query
            .PageBy(skipCount, maxResultCount)
            .ToListAsync(GetCancellationToken(cancellationToken));
    }

    /// <summary>
    /// 查询-未读消息条数
    /// </summary>
    /// <param name="userId">用户Id</param>
    /// <param name="cancellationToken">取消token</param>
    /// <returns></returns>
    public async Task<long> GetUnReadCountAsync(Guid userId, CancellationToken cancellationToken = default)
    {
        var dbSet = await GetDbSetAsync();
        return await dbSet
            .Where(ReceivingExpression)
            .Where(m =>
                m.Scopes.Any(ms => ms.ProviderName == MessageScopingConstants.MessageScopingProviderName.System)
                && !m.Notifications.Any(mn => mn.UserId == userId && mn.IsRead)
                || m.Scopes.All(ms => ms.ProviderName != MessageScopingConstants.MessageScopingProviderName.System)
                && m.Notifications.Any(mn => mn.UserId == userId && !mn.IsRead))
            .LongCountAsync(cancellationToken);
    }

    /// <summary>
    /// 查询-未读消息列表
    /// </summary>
    /// <param name="userId">用户Id</param>
    /// <param name="includeDetails">是否包含明细</param>
    /// <param name="cancellationToken">取消token</param>
    /// <returns></returns>
    public async Task<List<Message>> GetUnReadListAsync(
        Guid userId,
        bool includeDetails = true,
        CancellationToken cancellationToken = default)
    {
        var dbSet = await GetDbSetAsync();
        return await dbSet
            .IncludeDetails(includeDetails)
            .Where(ReceivingExpression)
            .Where(m =>
                m.Scopes.Any(ms => ms.ProviderName == MessageScopingConstants.MessageScopingProviderName.System)
                && !m.Notifications.Any(mn => mn.UserId == userId && mn.IsRead)
                || m.Scopes.All(ms => ms.ProviderName != MessageScopingConstants.MessageScopingProviderName.System)
                && m.Notifications.Any(mn => mn.UserId == userId && !mn.IsRead))
            .ToListAsync(cancellationToken);
    }

    protected virtual async Task<IQueryable<ReceivedMessage>> GetQueryableAsync(
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
        bool includeDetails = true)
    {
        var dbSet = await GetDbSetAsync();
        return dbSet
            .IncludeDetails(includeDetails)
            // 状态为已发送并且未到期
            .Where(ReceivingExpression)
            .WhereIf(!applicationName.IsNullOrWhiteSpace(), m => m.ApplicationName == applicationName)
            .WhereIf(messageType.HasValue, m => m.MessageType == messageType)
            .WhereIf(!title.IsNullOrWhiteSpace(), m => m.Title.Contains(title!.Trim()))
            .WhereIf(!content.IsNullOrWhiteSpace(), m => m.Content.Contains(content!.Trim()))
            .WhereIf(sendTimeStart.HasValue, m => m.SendTime >= sendTimeStart)
            .WhereIf(sendTimeEnd.HasValue, m => m.SendTime <= sendTimeEnd)
            .WhereIf(!sendUserName.IsNullOrWhiteSpace(), m => m.SendUserName.Contains(sendUserName!.Trim()))
            // 系统消息或者有通知标记的消息
            .WhereIf(!isRead.HasValue, m =>
                m.Scopes.Any(ms => ms.ProviderName == MessageScopingConstants.MessageScopingProviderName.System)
                || m.Notifications.Any(mn => mn.UserId == userId))
            // 已读消息，有通知标记为已读的消息
            .WhereIf(isRead.HasValue && isRead.Value,
                m => m.Notifications.Any(mn => mn.IsRead && mn.UserId == userId))
            // 用户未读数据，系统消息并且无用户阅读记录，或其他类型并且用户阅读记录中标记为未读
            .WhereIf(isRead.HasValue && !isRead.Value,
                m =>
                    m.Scopes.Any(ms => ms.ProviderName == MessageScopingConstants.MessageScopingProviderName.System)
                    && !m.Notifications.Any(mn => mn.UserId == userId && mn.IsRead)
                    || m.Scopes.All(ms => ms.ProviderName != MessageScopingConstants.MessageScopingProviderName.System)
                    && m.Notifications.Any(mn => mn.UserId == userId && !mn.IsRead))
            .WhereIf(tag.HasValue, m => (m.Tag & tag) == 1)
            .Select(m => new ReceivedMessage
            {
                Message = m,
                IsRead = isRead ?? m.Notifications.Any(mn => mn.UserId == userId && mn.IsRead),
                ReadTime = m.Notifications
                    .Where(mn => mn.UserId == userId)
                    .Select(mn => mn.ReadTime)
                    .FirstOrDefault()
            });
    }

    protected virtual ReceivedMessage MapToReceivedMessage(Message message, Guid userId)
    {
        return new ReceivedMessage
        {
            Message = message,
            IsRead = message.IsRead(userId),
            ReadTime = message.Notifications.FirstOrDefault(mn => mn.UserId == userId)?.ReadTime
        };
    }

    protected virtual Expression<Func<Message, bool>> ReceivingExpression => m =>
        (!m.ExpirationTime.HasValue || m.ExpirationTime.Value >= DateTime.Now)
        && m.Status == MessageStatus.Sent;
}
