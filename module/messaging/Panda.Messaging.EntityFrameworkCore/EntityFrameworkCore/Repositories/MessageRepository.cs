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

public class MessageRepository : EfCoreRepository<IMessageDbContext, Message, Guid>, IMessageRepository
{
    public MessageRepository(IDbContextProvider<IMessageDbContext> dbContextProvider) : base(dbContextProvider)
    {
    }

    public override async Task<IQueryable<Message>> WithDetailsAsync()
    {
        var query = await GetQueryableAsync();
        return query.Include(m => m.Scopes)
            .Include(m => m.Notifications);
    }

    /// <summary>
    /// 查询-已读人数
    /// </summary>
    /// <param name="id">消息Id</param>
    /// <param name="userId">用户Id</param>
    /// <param name="cancellationToken">取消token</param>
    /// <returns>int</returns>
    public virtual async Task<int> GetReaderCountAsync(
        Guid id,
        Guid userId,
        CancellationToken cancellationToken = default)
    {
        var dbSet = await GetDbSetAsync();
        var dbContext = await GetDbContextAsync();
        var query = from messageNotification in dbContext.Set<MessageNotification>()
                    join message in dbSet on messageNotification.MessageId equals message.Id
                    where messageNotification.MessageId == id
                          && messageNotification.IsRead
                          && (message.Scopes.Any(ms => ms.ProviderName == MessageScopingConstants.MessageScopingProviderName.System)
                              || message.Notifications.Any(mn => mn.UserId == userId))
                    select 1;

        return await query
            .CountAsync(cancellationToken);
    }

    /// <summary>
    /// 查询-消息列表
    /// </summary>
    /// <param name="messageIds">消息Id集合</param>
    /// <param name="includeDetails">包含明细信息</param>
    /// <param name="cancellationToken">取消token</param>
    /// <returns></returns>
    public async Task<List<Message>> GetWithMessageIdsAsync(
        Guid[] messageIds,
        bool includeDetails = true,
        CancellationToken cancellationToken = default)
    {
        var dbSet = await GetDbSetAsync();
        return await dbSet
            .IncludeDetails(includeDetails)
            .Where(m => messageIds.Contains(m.Id))
            .ToListAsync(cancellationToken: cancellationToken);
    }

    public virtual async Task<long> GetCountAsync(
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
        CancellationToken cancellationToken = default)
    {
        var query = await GetQueryableAsync(applicationName, messageType, pushProviderCode, title, content, delayedSend,
            sendTimeStart, sendTimeEnd, sendUserName, status, tag);

        return await query.LongCountAsync(GetCancellationToken(cancellationToken));
    }

    public virtual async Task<List<Message>> GetListAsync(
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
        CancellationToken cancellationToken = default)
    {
        var query = await GetQueryableAsync(applicationName, messageType, pushProviderCode, title, content, delayedSend,
            sendTimeStart, sendTimeEnd, sendUserName, status, tag);

        return await query
            .IncludeDetails(includeDetails)
            .OrderBy(sorting ?? "Status Asc, CreationTime Desc")
            .PageBy(skipCount, maxResultCount)
            .ToListAsync(GetCancellationToken(cancellationToken));
    }

    protected virtual async Task<IQueryable<Message>> GetQueryableAsync(
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
        long? tag = null)
    {
        var dbSet = await GetDbSetAsync();
        return dbSet
            .AsNoTracking()
            .WhereIf(!applicationName.IsNullOrWhiteSpace(), m => m.ApplicationName == applicationName)
            .WhereIf(messageType.HasValue, m => m.MessageType == messageType)
            .WhereIf(pushProviderCode.HasValue, m => (m.PushProviderCode & pushProviderCode) > 0)
            .WhereIf(!title.IsNullOrWhiteSpace(), m => m.Title.Contains(title!.Trim()))
            .WhereIf(!content.IsNullOrWhiteSpace(), m => m.Content.Contains(content!.Trim()))
            .WhereIf(delayedSend.HasValue, m => m.DelayedSend == delayedSend)
            .WhereIf(sendTimeStart.HasValue, m => m.SendTime >= sendTimeStart)
            .WhereIf(sendTimeEnd.HasValue, m => m.SendTime <= sendTimeEnd)
            .WhereIf(!sendUserName.IsNullOrWhiteSpace(), m => m.SendUserName.Contains(sendUserName!.Trim()))
            .WhereIf(status.HasValue, m => m.Status == status)
            .WhereIf(tag.HasValue, m => (m.Tag & tag) == 1);
    }
}