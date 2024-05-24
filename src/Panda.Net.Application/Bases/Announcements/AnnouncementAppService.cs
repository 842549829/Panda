using Panda.Messaging.Domain;
using Panda.Messaging.Domain.Shared.Constants;
using Panda.Messaging.Domain.Shared.Enums;
using Panda.Messaging.Domain.Shared.EventData;
using Panda.Messaging.Domain.Shared.Models;
using Panda.Net.Bases.Announcements.Dtos;
using Panda.Net.Bases.Announcements.Entities;
using System;
using System.Linq;
using System.Linq.Dynamic.Core;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Repositories;
using Volo.Abp.EventBus.Distributed;
using Volo.Abp.Linq;
using Volo.Abp.Uow;
using Volo.Abp.Users;

namespace Panda.Net.Bases.Announcements;

public class AnnouncementAppService :
    CrudAppService<Announcement,
        AnnouncementDto,
        AnnouncementListDto,
        Guid,
        AnnouncementGetListInputDto,
        AnnouncementCreateInputDto,
        AnnouncementUpdateInputDto>,
    IAnnouncementAppService
{
    public IAsyncQueryableExecuter AsyncQueryableExecuter { get; }

    private readonly IDistributedEventBus _eventBus;

    public AnnouncementAppService(IRepository<Announcement, Guid> repository,
        IDistributedEventBus eventBus, IAsyncQueryableExecuter asyncQueryableExecuter) : base(repository)
    {
        AsyncQueryableExecuter = asyncQueryableExecuter;
        _eventBus = eventBus;
    }

    public override async Task<AnnouncementDto> CreateAsync(AnnouncementCreateInputDto input)
    {
        input.PublishTime ??= Clock.Now;
        input.CreatorName ??= CurrentUser.Name ?? "System";
        var announcement = await base.CreateAsync(input);

        //发送系统消息
        await _eventBus.PublishAsync(new MessageGenerateEto
        {
            MessageId = announcement.Id,
            ApplicationName = NetRemoteServiceConsts.ApplicationName,
            MessageType = MessageType.Default,
            PushProviderCode = PushProviderCode.System,
            Title = input.Title,
            Content = input.Content,
            DelayedSend = input.PublishType == 1,
            SendTime = input.PublishTime,
            SendUserId = CurrentUser.GetId(),
            SendUserName = CurrentUser.Name ?? "System",
            Scopes = new[]
            {
                new MessageScopeModel
                {
                    ProviderName = MessageScopingConstants.MessageScopingProviderName.System,
                    ProviderKey = string.Empty
                }
            }
        });

        return announcement;
    }

    public override async Task DeleteAsync(Guid id)
    {
        await base.DeleteAsync(id);

        await _eventBus.PublishAsync(new MessageRecallEto
        {
            MessageId = id,
            RecalledUserId = CurrentUser.GetId(),
            RecalledUserName = CurrentUser.Name ?? "System"
        });
    }

    public override async Task<PagedResultDto<AnnouncementListDto>> GetListAsync(AnnouncementGetListInputDto input)
    {
        await CheckGetListPolicyAsync().ConfigureAwait(false);
        var query = await CreateFilteredQueryAsync(input);
        var totalCount = await AsyncQueryableExecuter.CountAsync(query);
        query = ApplySorting(query, input.Sorting);
        query = ApplyPaging(query, input);
        var items = (await AsyncQueryableExecuter.ToListAsync(query).ConfigureAwait(false))
            .Select(MapToGetListOutputDto)
            .ToList();
        return new PagedResultDto<AnnouncementListDto>(totalCount, items);
    }

    protected override async Task<IQueryable<Announcement>> CreateFilteredQueryAsync(AnnouncementGetListInputDto input)
    {
        var query = await Repository.GetQueryableAsync();
        return query
            .WhereIf(!input.Title.IsNullOrWhiteSpace(), d => d.Title.Contains(input.Title!))
            .WhereIf(input.PublishType.HasValue && input.PublishType.Value == input.PublishType,
                d => d.PublishType == input.PublishType || d.PublishTime < DateTime.Now)
            .WhereIf(input.PublishType.HasValue && input.PublishType.Value == input.PublishType,
                d => d.PublishType == input.PublishType && d.PublishTime >= DateTime.Now);
    }

    /// <summary>
    /// 排序
    /// </summary>
    /// <param name="query">query</param>
    /// <param name="sorting">排序字段</param>
    /// <param name="defaultSorting">默认排序</param>
    /// <returns>IQueryable</returns>
    private static IQueryable<Announcement> ApplySorting(
        IQueryable<Announcement> query,
        string? sorting,
        string? defaultSorting = null)
    {
        if (!sorting.IsNullOrWhiteSpace())
        {
            return query.OrderBy(sorting.ToUpper());
        }

        return defaultSorting != null
            ? query.OrderBy(defaultSorting.ToUpper())
            : query.OrderByDescending(d => d.CreationTime);
    }
}