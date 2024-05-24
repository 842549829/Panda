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


public class MessageAppService : CrudAppService<Message, MessageDto, MessageListDto, Guid, GetMessagesInputDto,
        MessageCreateDto, MessageUpdateDto>,
    IMessageAppService
{
    public MessageAppService(
        MessageManager manager,
        IMessageRepository repository,
        MessageFactory messageFactory,
        IMessagePublisher messagePublisher) : base(repository)
    {
        Manager = manager;
        Repository = repository;
        MessageFactory = messageFactory;
        MessagePublisher = messagePublisher;
    }

    protected MessageManager Manager { get; }
    protected MessageFactory MessageFactory { get; }
    protected IMessagePublisher MessagePublisher { get; }
    protected new virtual IMessageRepository Repository { get; }

    public override async Task<PagedResultDto<MessageListDto>> GetListAsync(GetMessagesInputDto input)
    {
        var totalCount = await Repository.GetCountAsync(input.ApplicationName, input.MessageType,
            input.PushProviderCode, input.Title, input.Content, input.DelayedSend, input.SendTimeStart,
            input.SendTimeEnd, input.SendUserName, input.Status, ToNullableBitLong(input.Tag));

        var entities = await Repository.GetListAsync(input.Sorting, input.MaxResultCount, input.SkipCount,
            input.ApplicationName, input.MessageType, input.PushProviderCode, input.Title, input.Content,
            input.DelayedSend, input.SendTimeStart, input.SendTimeEnd, input.SendUserName,
            input.Status, ToNullableBitLong(input.Tag));

        return new PagedResultDto<MessageListDto>(totalCount, entities.Select(MapToGetListOutputDto).ToList());
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
                await Repository.GetWithMessageIdsAsync(batchOperateDto.MessageIds);

            foreach (var message in messages)
            {
                await MessagePublisher.RecallAsync(message);

                await Repository.DeleteAsync(message);
            }

            await CurrentUnitOfWork.SaveChangesAsync();
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
                await Repository.GetWithMessageIdsAsync(batchOperateDto.MessageIds);

            foreach (var message in messages)
            {
                await MessagePublisher.RecallAsync(message);

                await Manager.RecallAsync(message, CurrentUser.GetId(), GetCurrentUserName());
            }

            await CurrentUnitOfWork!.SaveChangesAsync();
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