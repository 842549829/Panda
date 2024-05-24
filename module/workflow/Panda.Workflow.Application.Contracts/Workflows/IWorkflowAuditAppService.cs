using Panda.Workflow.Application.Contracts.Workflows.Dtos;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Panda.Workflow.Application.Contracts.Workflows;

public interface IWorkflowAuditAppService : IApplicationService
{
    /// <summary>
    /// 获取我的审核列表
    /// </summary>
    /// <param name="input">查询条件</param>
    /// <returns>结果</returns>
    Task<PagedResultDto<GetMyAuditPageListOutput>> GetListAsync(GetMyAuditPageListInput input);

    /// <summary>
    /// 获取详情
    /// </summary>
    /// <param name="id">流程ID</param>
    /// <returns>结果</returns>
    Task<WorkflowAuditDto> GetAuditRecordsAsync(Guid id);

    /// <summary>
    /// 审核
    /// </summary>
    /// <param name="input">审核参数</param>
    /// <returns>结果</returns>
    Task AuditAsync(WorkflowAuditInput input);
}