using JetBrains.Annotations;
using Panda.Messaging.Application.Contracts;
using Panda.Messaging.Domain.Entities;
using Panda.Messaging.Domain.Factories;
using Panda.Messaging.Domain.Managers;
using Panda.Messaging.Domain.Publishers;
using Panda.Messaging.Domain.Repositories;
using Panda.Messaging.Domain.Shared.Models;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Users;

namespace Panda.Messaging.Application;

/// <summary>
/// 应用服务：发信箱
/// </summary>
public class OutboxAppService : CrudAppService<Message, MessageDto, MessageListDto, Guid, GetSentMessagesInputDto,
        MessageCreateDto, MessageUpdateDto>,
    IOutboxAppService
{
    public OutboxAppService(
        MessageManager manager,
        MessageFactory messageFactory,
        IMessagePublisher messagePublisher,
        IMessageRepository messageRepository,
        IMessageSendingRepository messageSendingRepository) : base(messageRepository)
    {
        Manager = manager;
        MessageFactory = messageFactory;
        MessagePublisher = messagePublisher;
        MessageSendingRepository = messageSendingRepository;
        MessageRepository = messageRepository;
    }
    protected MessageManager Manager { get; }
    protected MessageFactory MessageFactory { get; }
    protected IMessagePublisher MessagePublisher { get; }
    protected IMessageRepository MessageRepository { get; }
    protected IMessageSendingRepository MessageSendingRepository { get; }

    public override async Task<PagedResultDto<MessageListDto>> GetListAsync(GetSentMessagesInputDto input)
    {
        var totalCount = await MessageSendingRepository.GetCountAsync(CurrentUser.GetId(), input.ApplicationName,
            input.MessageType, input.PushProviderCode, input.Title, input.Content, input.DelayedSend,
            input.SendTimeStart, input.SendTimeEnd, input.Status, ToNullableBitLong(input.Tag),
            input.ProviderName, input.ProviderKey, input.ReceiverId);

        var entities = await MessageSendingRepository.GetListAsync(CurrentUser.GetId(), input.Sorting,
            input.MaxResultCount,
            input.SkipCount, input.ApplicationName, input.MessageType, input.PushProviderCode, input.Title,
            input.Content, input.DelayedSend, input.SendTimeStart, input.SendTimeEnd, input.Status,
            ToNullableBitLong(input.Tag), input.ProviderName, input.ProviderKey,
            input.ReceiverId);

        return new PagedResultDto<MessageListDto>(totalCount, entities.Select(MapToGetListOutputDto).ToList());
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

    public override async Task<MessageDto> CreateAsync(MessageCreateDto input)
    {
        var entity = MapToEntity(input);

        await Manager.CreateAsync(entity);

        await MessagePublisher.PublishAsync(entity);

        return await MapToGetOutputDtoAsync(entity);
    }

    public override async Task DeleteAsync(Guid id)
    {
        var message = await GetEntityByIdAsync(id);

        await MessagePublisher.RecallAsync(message);
            
        await Repository.DeleteAsync(message);
    }

    /// <summary>
    /// 删除-批量删除
    /// </summary>
    /// <param name="batchOperateDto">批量删除信息</param>
    /// <returns></returns>
    public virtual async Task BatchDeleteAsync(MessageBatchOperateDto batchOperateDto)
    {
        if (!batchOperateDto.MessageIds.IsNullOrEmpty())
        {
            var messages =
                await MessageSendingRepository.GetWithMessageIdsAsync(batchOperateDto.MessageIds,
                    CurrentUser.GetId());

            foreach (var message in messages)
            {
                await MessagePublisher.RecallAsync(message);
                    
                await Repository.DeleteAsync(message);
            }

            await CurrentUnitOfWork!.SaveChangesAsync();
        }
    }

    /// <summary>
    /// 修改-消息撤回
    /// </summary>
    /// <param name="id">消息Id</param>
    /// <returns></returns>
    public virtual async Task<MessageDto> RecallAsync(Guid id)
    {
        var message = await GetEntityByIdAsync(id);

        await MessagePublisher.RecallAsync(message);

        await Manager.RecallAsync(message, CurrentUser.GetId(), GetCurrentUserName());

        return await MapToGetOutputDtoAsync(message);
    }

    /// <summary>
    /// 修改-批量撤回
    /// </summary>
    /// <param name="batchOperateDto"></param>
    /// <returns></returns>
    public virtual async Task BatchRecallAsync(MessageBatchOperateDto batchOperateDto)
    {
        if (!batchOperateDto.MessageIds.IsNullOrEmpty())
        {
            var messages =
                await MessageSendingRepository.GetWithMessageIdsAsync(batchOperateDto.MessageIds,
                    CurrentUser.GetId());

            foreach (var message in messages)
            {
                await MessagePublisher.RecallAsync(message);
                    
                await Manager.RecallAsync(message, CurrentUser.GetId(), GetCurrentUserName());
            }
        }
    }

    /// <summary>
    /// 获取当前用户名称
    /// </summary>
    /// <returns></returns>
    protected virtual string GetCurrentUserName()
    {
        return CurrentUser.FindClaimValue("name") ?? CurrentUser.UserName!;
    }

    protected override Message MapToEntity(MessageCreateDto createInput)
    {
        return MessageFactory.CreateAsync(createInput.ApplicationName, createInput.MessageType,
                createInput.PushProviderCode, createInput.Title, createInput.Content, createInput.DelayedSend,
                CurrentUser.GetId(), GetCurrentUserName(),
                createInput.Scopes.Select(MapToMessageScopeModel).ToArray(),
                tag: ToNullableBitLong(createInput.Tag),
                sendTime: createInput.SendTime, expirationTime: createInput.ExpirationTime,
                extraProperties: createInput.ExtraProperties)
            .ConfigureAwait(false)
            .GetAwaiter()
            .GetResult();
    }

    protected virtual MessageScopeModel MapToMessageScopeModel(MessageScopeDto input)
    {
        return ObjectMapper.Map<MessageScopeDto, MessageScopeModel>(input);
    }

    protected override Task<Message> GetEntityByIdAsync(Guid id)
    {
        return MessageSendingRepository.GetAsync(id, CurrentUser.GetId());
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

        return l == 0 ? (long?) null : l;
    }
}