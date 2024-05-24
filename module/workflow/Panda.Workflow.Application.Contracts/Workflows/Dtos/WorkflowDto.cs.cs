using Abp.Workflow;
using Volo.Abp.Application.Dtos;
using WorkflowCore.Models;

namespace Panda.Workflow.Application.Contracts.Workflows.Dtos;

public class WorkflowDto : EntityDto<Guid>
{
    public string WorkflowDefinitionId { get; set; } = default!;
    public int Version { get; set; }

    /// <summary>
    /// 流程定义输入的数据
    /// </summary>
    public IEnumerable<IEnumerable<IEnumerable<WorkflowFormData>>> Inputs { get; set; } = default!;

    /// <summary>
    /// 流程输入数据
    /// </summary>
    public Dictionary<string, object> Data { get; set; } = default!;
    /// <summary>
    /// 用户名
    /// </summary>
    public string UserName { get; set; } = default!;
    /// <summary>
    /// 流程名
    /// </summary>
    public string Title { get; set; } = default!;
    /// <summary>
    /// 提交时间
    /// </summary>
    public DateTime CreationTime { get; set; }
    public DateTime? CompleteTime { get; set; }
    public WorkflowStatus Status { get; set; }

    public IEnumerable<WorkflowExecutionRecord> ExecutionRecords { get; set; } = default!;
}
public class WorkflowExecutionRecord
{
    public string ExecutionPointerId { get; set; } = default!;
    public string StepName { get; set; } = default!;
    public int StepId { get; set; }
    public string? StepTitle { get; set; }
    public DateTime? StartTime { get; set; }
    public DateTime? EndTime { get; set; }
}