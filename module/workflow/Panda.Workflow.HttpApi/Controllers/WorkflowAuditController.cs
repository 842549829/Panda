using Microsoft.AspNetCore.Mvc;
using Panda.Workflow.Application.Contracts.Workflows;
using Panda.Workflow.Application.Contracts.Workflows.Dtos;
using Volo.Abp.Application.Dtos;
using Volo.Abp.AspNetCore.Mvc;

namespace Panda.Workflow.HttpApi.Controllers;

/// <summary>
/// 流程定义
/// </summary>
[Route("api/workflow/audit")]
[ApiController]
public class WorkflowAuditController : AbpControllerBase
{
    /// <summary>
    /// 流程审核接口
    /// </summary>
    private readonly IWorkflowAuditAppService _workflowAuditAppService;

    /// <summary>
    /// 构造函数
    /// </summary>
    /// <param name="workflowAuditAppService">流程审核接口</param>
    public WorkflowAuditController(IWorkflowAuditAppService workflowAuditAppService)
    {
        _workflowAuditAppService = workflowAuditAppService;
    }

    /// <summary>
    /// 获取我的审核列表
    /// </summary>
    /// <param name="input">查询条件</param>
    /// <returns>结果</returns>
    [HttpGet("list")]
    public async Task<PagedResultDto<GetMyAuditPageListOutput>> GetListAsync([FromQuery] GetMyAuditPageListInput input)
    {
        return await _workflowAuditAppService.GetListAsync(input);
    }

    /// <summary>
    /// 获取详情
    /// </summary>
    /// <param name="id">流程ID</param>
    /// <returns>结果</returns>
    [HttpGet("{id}")]
    public async Task<WorkflowAuditDto> GetAuditRecordsAsync(Guid id)
    {
        return await _workflowAuditAppService.GetAuditRecordsAsync(id);
    }

    /// <summary>
    /// 审核
    /// </summary>
    /// <param name="input">审核参数</param>
    /// <returns>结果</returns>
    [HttpPut]
    public async Task AuditAsync([FromBody] WorkflowAuditInput input)
    {
        await _workflowAuditAppService.AuditAsync(input);
    }
}