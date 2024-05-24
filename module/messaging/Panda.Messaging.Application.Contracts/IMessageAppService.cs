using Volo.Abp.Application.Services;

namespace Panda.Messaging.Application.Contracts;

/// <summary>
/// 应用服务：消息
/// </summary>
public interface IMessageAppService : ICrudAppService<MessageDto, MessageListDto, Guid, GetMessagesInputDto,
    MessageCreateDto, MessageUpdateDto>
{
    /// <summary>
    /// 删除-批量删除
    /// </summary>
    /// <param name="batchOperateDto">批量删除信息</param>
    /// <returns></returns>
    Task BatchDeleteAsync(MessageBatchOperateDto batchOperateDto);

    /// <summary>
    /// 修改-消息撤回
    /// </summary>
    /// <param name="id">消息Id</param>
    /// <returns></returns>
    Task<MessageDto> RecallAsync(Guid id);

    /// <summary>
    /// 修改-批量撤回
    /// </summary>
    /// <param name="batchOperateDto"></param>
    /// <returns></returns>
    Task BatchRecallAsync(MessageBatchOperateDto batchOperateDto);
}