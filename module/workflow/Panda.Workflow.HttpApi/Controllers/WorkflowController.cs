using Abp.Workflow;
using Microsoft.AspNetCore.Mvc;
using Panda.Workflow.Application.Contracts.Workflows;
using Panda.Workflow.Application.Contracts.Workflows.Dtos;
using Volo.Abp.Application.Dtos;
using Volo.Abp.AspNetCore.Mvc;

namespace Panda.Workflow.HttpApi.Controllers;

/// <summary>
/// 流程定义
/// </summary>
[Route("api/workflow")]
[ApiController]
public class WorkflowController : AbpControllerBase
{
    /// <summary>
    /// 流程服务接口
    /// </summary>
    private readonly IWorkflowAppService _workflowAppService;

    /// <summary>
    /// 构造函数
    /// </summary>
    /// <param name="workflowAppService">流程服务接口</param>
    public WorkflowController(IWorkflowAppService workflowAppService)
    {
        _workflowAppService = workflowAppService;
    }

    /// <summary>
    /// 获取所有分组
    /// </summary>
    /// <returns>获取所有分组</returns>
    [HttpGet("all-group")]
    public async Task<IEnumerable<string>> GetAllGroupAsync()
    {
        return await _workflowAppService.GetAllGroupAsync();
    }

    /// <summary>
    /// 我发起的流程
    /// </summary>
    /// <param name="input">查询参数</param>
    /// <returns>结果列表</returns>
    [HttpGet("my")]
    public async Task<PagedResultDto<MyWorkflowListOutput>> GetMyWorkflowAsync([FromQuery] WorkflowListInput input)
    {
        return await _workflowAppService.GetMyWorkflowAsync(input);
    }

    /// <summary>
    /// 获取所有的步骤
    /// </summary>
    /// <returns>结果</returns>
    [HttpGet("all-step")]
    public IEnumerable<AbpWorkflowStepBody> GetAllStepBodys()
    {
        return _workflowAppService.GetAllStepBodys();
    }

    /// <summary>
    /// 获取所有分组的流程
    /// </summary>
    /// <param name="input">查询条件</param>
    /// <returns>结果</returns>
    [HttpGet("all-with-group")]
    public async Task<Dictionary<string, IEnumerable<WorkflowDesignInfo>>> GetAllWithGroupAsync([FromQuery] WorkflowListInput input)
    {
        return await _workflowAppService.GetAllWithGroupAsync(input);
    }

    /// <summary>
    /// 获取单个流程定义
    /// </summary>
    /// <param name="id">id</param>
    /// <returns>结果</returns>
    [HttpGet("{id}")]
    public Task<WorkflowDesignInfo> GetAsync(string id)
    {
        return _workflowAppService.GetAsync(id);
    }

    /// <summary>
    /// 创建流程定义
    /// </summary>
    /// <param name="input">创建参数</param>
    /// <returns>结果</returns>
    [HttpPost]
    public async Task<WorkflowDesignInfo> CreateAsync([FromBody] WorkflowDesignInfo input)
    {
        return await _workflowAppService.CreateAsync(input);
    }

    /// <summary>
    /// 获取流程列表
    /// </summary>
    /// <param name="input">查询条件</param>
    /// <returns>结果</returns>
    [HttpGet("list")]
    public async Task<PagedResultDto<WorkflowDesignInfo>> GetListAsync([FromQuery] WorkflowListInput input)
    {
        return await _workflowAppService.GetListAsync(input);
    }

    /// <summary>
    /// 更新流程定义
    /// </summary>
    /// <param name="id">id</param>
    /// <param name="input">更新参数</param>
    /// <returns>结果</returns>
    [HttpPut("{id}")]
    public async Task<WorkflowDesignInfo> UpdateAsync(string id, [FromBody] WorkflowDesignInfo input)
    {
        return await _workflowAppService.UpdateAsync(id, input);
    }

    /// <summary>
    /// 启动工作流
    /// </summary>
    /// <param name="input">请求参数</param>
    /// <returns>标识异步</returns>
    [HttpPut("start")]
    public async Task StartAsync([FromBody] StartWorkflowInput input)
    {
        await _workflowAppService.StartAsync(input);
    }

    /// <summary>
    /// 获取详情
    /// </summary>
    /// <param name="id">待审核ID</param>
    /// <returns>结果</returns>
    [HttpGet("details/{id}")]
    public async Task<WorkflowDto> GetDetailsAsync(Guid id)
    {
        return await _workflowAppService.GetDetailsAsync(id);
    }

    /// <summary>
    /// 发布事件
    /// </summary>
    /// <param name="input">发布参数</param>
    /// <returns>标识异步</returns>
    [HttpPut("push")]
    public async Task PublicEventAsync([FromBody] PublishEventInput input)
    {
        await _workflowAppService.PublicEventAsync(input);
    }

    /// <summary>
    /// 删除
    /// </summary>
    /// <param name="id">id</param>
    /// <returns>标识异步</returns>
    [HttpDelete("{id}")]
    public async Task DeleteAsync(string id)
    {
        await _workflowAppService.DeleteAsync(id);
    }
}