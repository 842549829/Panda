using Microsoft.EntityFrameworkCore;
using Panda.Messaging.Domain.Entities;
using Panda.Messaging.Domain.Repositories;
using Panda.Messaging.Domain.Shared.Constants;
using Panda.Messaging.Domain.Shared.Enums;
using Panda.Messaging.EntityFrameworkCore.EntityFrameworkCore.DbContext;
using System.Linq.Dynamic.Core;
using Volo.Abp.Domain.Repositories.EntityFrameworkCore;
using Volo.Abp.EntityFrameworkCore;

namespace Panda.Messaging.EntityFrameworkCore.EntityFrameworkCore.Repositories;

/// <summary>
/// 仓储：消息发送
/// </summary>
public class EfCoreMessageSendingRepository :
    EfCoreRepository<IMessageDbContext, Message, Guid>,
    IMessageSendingRepository
{
    public EfCoreMessageSendingRepository(IDbContextProvider<IMessageDbContext> dbContextProvider)
        : base(dbContextProvider)
    {
    }

    public override async Task<IQueryable<Message>> WithDetailsAsync()
    {
        var query = await GetQueryableAsync();
        return query.IncludeDetails();
    }


    /// <summary>
    /// 查询-发送消息
    /// </summary>
    /// <param name="messageId">消息Id</param>
    /// <param name="userId">用户Id</param>
    /// <param name="includeDetails">包含明细信息</param>
    /// <param name="cancellationToken">取消token</param>
    /// <returns></returns>
    public virtual Task<Message> GetAsync(
        Guid messageId,
        Guid userId,
        bool includeDetails = true,
        CancellationToken cancellationToken = default)
    {
        return GetAsync(m => m.Id == messageId && m.SendUserId == userId, includeDetails, cancellationToken);
    }

    /// <summary>
    /// 查询-发送消息
    /// </summary>
    /// <param name="messageIds">消息Id集合</param>
    /// <param name="userId">用户Id</param>
    /// <param name="includeDetails">包含明细信息</param>
    /// <param name="cancellationToken">取消token</param>
    /// <returns></returns>
    public virtual async Task<List<Message>> GetWithMessageIdsAsync(
        Guid[] messageIds,
        Guid userId,
        bool includeDetails = true,
        CancellationToken cancellationToken = default)
    {
        var query = await GetQueryableAsync(userId);
        return await query
            .IncludeDetails(includeDetails)
            .Where(m => messageIds.Contains(m.Id))
            .OrderBy(m => m.Status)
            .ThenByDescending(m => m.SendTime)
            .ToListAsync(cancellationToken);
    }

    /// <summary>
    /// 查询-发送消息条数
    /// </summary>
    /// <param name="userId">用户Id</param>
    /// <param name="applicationName">所属系统名称（消息发起系统）</param>
    /// <param name="messageType">消息类型 1：通知，2：预警，99：其他 ...</param>
    /// <param name="pushProviderCode">消息推送方式 1：系统消息，2：短信消息，4：邮件消息</param>
    /// <param name="title">消息标题</param>
    /// <param name="content">消息内容</param>
    /// <param name="delayedSend">是否延时发送</param>
    /// <param name="sendTimeStart">发送时间-开始</param>
    /// <param name="sendTimeEnd">发送时间-结束</param>
    /// <param name="status">消息状态</param>
    /// <param name="tag">标签</param>
    /// <param name="scopeProviderName">消息通知范围服务名称</param>
    /// <param name="scopeProviderKey">消息通知范围服务标识</param>
    /// <param name="receiverId">收件人Id</param>
    /// <param name="cancellationToken">取消token</param>
    /// <returns></returns>
    public virtual async Task<long> GetCountAsync(
        Guid userId,
        string? applicationName = null,
        MessageType? messageType = null,
        PushProviderCode? pushProviderCode = null,
        string? title = null,
        string? content = null,
        bool? delayedSend = null,
        DateTime? sendTimeStart = null,
        DateTime? sendTimeEnd = null,
        MessageStatus? status = null,
        long? tag = null,
        string? scopeProviderName = null,
        string? scopeProviderKey = null,
        Guid? receiverId = null,
        CancellationToken cancellationToken = default)
    {
        var query = await GetQueryableAsync(userId, applicationName, messageType, pushProviderCode, title, content,
            delayedSend, sendTimeStart, sendTimeEnd, status, tag, scopeProviderKey, scopeProviderName, receiverId);

        return await query.LongCountAsync(GetCancellationToken(cancellationToken));
    }

    /// <summary>
    /// 查询-发送消息列表
    /// </summary>
    /// <param name="userId">用户Id</param>
    /// <param name="sorting">排序条件</param>
    /// <param name="maxResultCount">分页大小</param>
    /// <param name="skipCount">跳过条数</param>
    /// <param name="applicationName">所属系统名称（消息发起系统）</param>
    /// <param name="messageType">消息类型 1：通知，2：预警，99：其他 ...</param>
    /// <param name="pushProviderCode">消息推送方式 1：系统消息，2：短信消息，4：邮件消息</param>
    /// <param name="title">消息标题</param>
    /// <param name="content">消息内容</param>
    /// <param name="delayedSend">是否延时发送</param>
    /// <param name="sendTimeStart">发送时间-开始</param>
    /// <param name="sendTimeEnd">发送时间-结束</param>
    /// <param name="status">消息状态</param>
    /// <param name="tag">标签</param>
    /// <param name="scopeProviderName">消息通知范围服务名称</param>
    /// <param name="scopeProviderKey">消息通知范围服务标识</param>
    /// <param name="receiverId">收件人Id</param>
    /// <param name="includeDetails">包含明细信息</param>
    /// <param name="cancellationToken">取消token</param>
    /// <returns></returns>
    public virtual async Task<List<Message>> GetListAsync(
        Guid userId,
        string? sorting = null,
        int maxResultCount = int.MaxValue,
        int skipCount = 0,
        string? applicationName = null,
        MessageType? messageType = null,
        PushProviderCode? pushProviderCode = null,
        string? title = null,
        string? content = null,
        bool? delayedSend = null,
        DateTime? sendTimeStart = null,
        DateTime? sendTimeEnd = null,
        MessageStatus? status = null,
        long? tag = null,
        string? scopeProviderName = null,
        string? scopeProviderKey = null,
        Guid? receiverId = null,
        bool includeDetails = true,
        CancellationToken cancellationToken = default)
    {
        var query = await GetQueryableAsync(userId, applicationName, messageType, pushProviderCode, title, content,
            delayedSend, sendTimeStart, sendTimeEnd, status, tag, scopeProviderKey, scopeProviderName, receiverId);

        return await query
            .IncludeDetails(includeDetails)
            .OrderBy(sorting ?? "Status Asc, CreationTime Desc")
            .PageBy(skipCount, maxResultCount)
            .ToListAsync(GetCancellationToken(cancellationToken));
    }

    protected virtual async Task<IQueryable<Message>> GetQueryableAsync(
        Guid userId,
        string? applicationName = null,
        MessageType? messageType = null,
        PushProviderCode? pushProviderCode = null,
        string? title = null,
        string? content = null,
        bool? delayedSend = null,
        DateTime? sendTimeStart = null,
        DateTime? sendTimeEnd = null,
        MessageStatus? status = null,
        long? tag = null,
        string? scopeProviderName = null,
        string? scopeProviderKey = null,
        Guid? receiverId = null)
    {
        var dbSet = await GetDbSetAsync();
        return dbSet
            .Where(m => m.SendUserId == userId)
            .WhereIf(!applicationName.IsNullOrWhiteSpace(), m => m.ApplicationName == applicationName)
            .WhereIf(messageType.HasValue, m => m.MessageType == messageType)
            .WhereIf(pushProviderCode.HasValue, m => (m.PushProviderCode & pushProviderCode) > 0)
            .WhereIf(!title.IsNullOrWhiteSpace(), m => m.Title.Contains(title!.Trim()))
            .WhereIf(!content.IsNullOrWhiteSpace(), m => m.Content.Contains(content!.Trim()))
            .WhereIf(delayedSend.HasValue, m => m.DelayedSend == delayedSend)
            .WhereIf(sendTimeStart.HasValue, m => m.SendTime >= sendTimeStart)
            .WhereIf(sendTimeEnd.HasValue, m => m.SendTime <= sendTimeEnd)
            .WhereIf(status.HasValue, m => m.Status == status)
            .WhereIf(tag.HasValue, m => (m.Tag & tag) == 1)
            .WhereIf(!scopeProviderKey.IsNullOrWhiteSpace(),
                m => m.Scopes.Any(ms => ms.ProviderKey == scopeProviderKey))
            .WhereIf(!scopeProviderName.IsNullOrWhiteSpace(),
                m => m.Scopes.Any(ms => ms.ProviderName == scopeProviderName))
            .WhereIf(receiverId.HasValue, m =>
                m.Scopes.Any(ms => ms.ProviderName == MessageScopingConstants.MessageScopingProviderName.System)
                || m.Notifications.Any(mn => mn.UserId == userId));
    }
}