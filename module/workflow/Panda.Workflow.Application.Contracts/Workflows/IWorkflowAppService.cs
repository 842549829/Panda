using Abp.Workflow;
using Panda.Workflow.Application.Contracts.Workflows.Dtos;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Panda.Workflow.Application.Contracts.Workflows;

public interface IWorkflowAppService : ICrudAppService<
    WorkflowDesignInfo,
    string,
    WorkflowListInput,
    WorkflowDesignInfo,
    WorkflowDesignInfo>
{
    /// <summary>
    /// 获取所有分组
    /// </summary>
    /// <returns>获取所有分组</returns>
    Task<IEnumerable<string>> GetAllGroupAsync();

    /// <summary>
    /// 我发起的流程
    /// </summary>
    /// <param name="input">查询参数</param>
    /// <returns>结果列表</returns>
    Task<PagedResultDto<MyWorkflowListOutput>> GetMyWorkflowAsync(WorkflowListInput input);

    /// <summary>
    /// 获取所有的步骤
    /// </summary>
    /// <returns>结果</returns>
    IEnumerable<AbpWorkflowStepBody> GetAllStepBodys();

    /// <summary>
    /// 获取所有分组的流程
    /// </summary>
    /// <param name="input">查询条件</param>
    /// <returns>结果</returns>
    Task<Dictionary<string, IEnumerable<WorkflowDesignInfo>>>
        GetAllWithGroupAsync(WorkflowListInput input);

    /// <summary>
    /// 启动工作流
    /// </summary>
    /// <param name="input">请求参数</param>
    /// <returns>标识异步</returns>
    Task StartAsync(StartWorkflowInput input);

    /// <summary>
    /// 获取详情
    /// </summary>
    /// <param name="id">待审核ID</param>
    /// <returns>结果</returns>
    Task<WorkflowDto> GetDetailsAsync(Guid id);

    /// <summary>
    /// 发布事件
    /// </summary>
    /// <param name="input">发布参数</param>
    /// <returns>标识异步</returns>
    Task PublicEventAsync(PublishEventInput input);

    /// <summary>
    /// 获取具体的某个流程定义
    /// </summary>
    /// <param name="id">id</param>
    /// <param name="version">版本号</param>
    /// <returns>结果</returns>
    Task<WorkflowDesignInfo> GetAsync(string id, int version);
}