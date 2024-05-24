using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Panda.Messaging.Application.Contracts;

/// <summary>
/// 应用服务：收信箱
/// </summary>
public interface IInboxAppService : IApplicationService
{
    /// <summary>
    /// 查询-根据Id
    /// </summary>
    /// <param name="id">消息Id</param>
    /// <returns></returns>
    Task<MessageReceivingDto> GetAsync(Guid id);

    /// <summary>
    /// 查询-分页
    /// </summary>
    /// <param name="input"></param>
    /// <returns></returns>
    Task<PagedResultDto<MessageReceivingListDto>> GetListAsync(GetReceivedMessagesInputDto input);

    /// <summary>
    /// 查询-已读人数
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    Task<int> GetReaderCountAsync(Guid id);

    /// <summary>
    /// 查询-未读消息数量
    /// </summary>
    /// <returns></returns>
    Task<long> GetUnReadCountAsync();

    /// <summary>
    /// 修改-标记已读
    /// </summary>
    /// <param name="id">消息Id</param>
    /// <returns></returns>
    Task MarkReadAsync(Guid id);

    /// <summary>
    /// 修改-批量已读
    /// </summary>
    /// <param name="input">操作参数</param>
    /// <returns></returns>
    Task BatchMarkReadAsync(MessageBatchOperateDto input);

    /// <summary>
    /// 修改-全部已读
    /// </summary>
    /// <returns></returns>
    Task MarkAllReadAsync();
}