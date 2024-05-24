using JetBrains.Annotations;
using Panda.Messaging.Application.Contracts;
using Panda.Messaging.Domain.Entities;
using Panda.Messaging.Domain.Managers;
using Panda.Messaging.Domain.Modules;
using Panda.Messaging.Domain.Repositories;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Authorization;
using Volo.Abp.Users;

namespace Panda.Messaging.Application;

/// <summary>
/// 应用服务：收信箱
/// </summary>
public class InboxAppService : ApplicationService, IInboxAppService
{
    public InboxAppService(
        MessageManager manager,
        IMessageRepository messageRepository,
        IMessageReceivingRepository receivingRepository)
    {
        Manager = manager;
        MessageRepository = messageRepository;
        ReceivingRepository = receivingRepository;
    }

    protected MessageManager Manager { get; }
    protected IMessageRepository MessageRepository { get; }
    protected IMessageReceivingRepository ReceivingRepository { get; }

    /// <summary>
    /// 查询-根据Id
    /// </summary>
    /// <param name="id">消息Id</param>
    /// <returns></returns>
    public virtual async Task<MessageReceivingDto> GetAsync(Guid id)
    {
        var message = await GetEntityByIdAsync(id);

        await Manager.MarkReadAsync(message.Message, CurrentUser.GetId());

        return MapToGetOutputDto(message);
    }

    /// <summary>
    /// 查询-分页
    /// </summary>
    /// <param name="input"></param>
    /// <returns></returns>
    public virtual async Task<PagedResultDto<MessageReceivingListDto>> GetListAsync(
        GetReceivedMessagesInputDto input)
    {
        if (!CurrentUser.Id.HasValue)
        {
            throw new AbpAuthorizationException();
        }

        var totalCount = await ReceivingRepository.GetCountAsync(CurrentUser.Id.Value, input.ApplicationName,
            input.MessageType, input.Title, input.Content, input.SendTimeStart, input.SendTimeEnd,
            input.SendUserName, input.IsRead, ToNullableBitLong(input.Tag));

        var messages = await ReceivingRepository.GetListAsync(CurrentUser.Id.Value, input.Sorting,
            input.MaxResultCount, input.SkipCount, input.ApplicationName, input.MessageType, input.Title,
            input.Content, input.SendTimeStart, input.SendTimeEnd, input.SendUserName, input.IsRead,
            ToNullableBitLong(input.Tag), false);

        return new PagedResultDto<MessageReceivingListDto>(totalCount,
            messages.Select(MapToGetListOutputDto).ToList());
    }

    /// <summary>
    /// 查询-已读人数
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public virtual Task<int> GetReaderCountAsync(Guid id)
    {
        return MessageRepository.GetReaderCountAsync(id, CurrentUser.GetId());
    }

    /// <summary>
    /// 查询-未读消息数量
    /// </summary>
    /// <returns></returns>
    public virtual Task<long> GetUnReadCountAsync()
    {
        return ReceivingRepository.GetUnReadCountAsync(CurrentUser.GetId());
    }

    /// <summary>
    /// 修改-标记已读
    /// </summary>
    /// <param name="id">消息Id</param>
    /// <returns></returns>
    public virtual async Task MarkReadAsync(Guid id)
    {
        var message = await ReceivingRepository.GetAsync(id, CurrentUser.GetId());

        if (!message.IsRead)
        {
            await Manager.MarkReadAsync(message.Message, CurrentUser.GetId());
        }
    }

    /// <summary>
    /// 修改-批量已读
    /// </summary>
    /// <param name="input">操作参数</param>
    /// <returns></returns>
    public virtual async Task BatchMarkReadAsync(MessageBatchOperateDto input)
    {
        if (!input.MessageIds.IsNullOrEmpty())
        {
            var messages = await ReceivingRepository.GetMessagesWithIdsAsync(input.MessageIds, CurrentUser.GetId());

            foreach (var message in messages.Where(m => !m.IsRead))
            {
                await Manager.MarkReadAsync(message.Message, CurrentUser.GetId());
            }
        }
    }

    /// <summary>
    /// 修改-全部已读
    /// </summary>
    /// <returns></returns>
    public virtual Task MarkAllReadAsync()
    {
        return Manager.MarkAllReadAsync(CurrentUser.GetId());
    }

    protected virtual Task<ReceivedMessage> GetEntityByIdAsync(Guid id)
    {
        if (!CurrentUser.Id.HasValue)
        {
            throw new AbpAuthorizationException();
        }

        return ReceivingRepository.GetAsync(id, CurrentUser.Id.Value);
    }

    protected virtual MessageReceivingDto MapToGetOutputDto(ReceivedMessage entity)
    {
        var messageDto = ObjectMapper.Map<Message, MessageReceivingDto>(entity.Message);

        messageDto.IsRead = entity.IsRead;
        messageDto.ReadTime = entity.ReadTime;

        return messageDto;
    }

    protected virtual MessageReceivingListDto MapToGetListOutputDto(ReceivedMessage entity)
    {
        var messageDto = ObjectMapper.Map<Message, MessageReceivingListDto>(entity.Message);

        messageDto.IsRead = entity.IsRead;
        messageDto.ReadTime = entity.ReadTime;

        return messageDto;
    }

    private static long? ToNullableBitLong([CanBeNull] string[] codes)
    {
        if (codes == null || !codes.Any())
        {
            return null;
        }

        long l = 0;
        foreach (var s in codes)
        {
            if (long.TryParse(s, out var result))
            {
                l += result;
            }
            else
            {
                return null;
            }
        }

        return l == 0 ? (long?)null : l;
    }
}

