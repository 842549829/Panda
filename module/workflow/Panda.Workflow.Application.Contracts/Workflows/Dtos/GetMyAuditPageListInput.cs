using Panda.Workflow.Domain.Shared.Base;
using Panda.Workflow.Domain.Shared.Enums;
using Volo.Abp.Application.Dtos;

namespace Panda.Workflow.Application.Contracts.Workflows.Dtos;

public class GetMyAuditPageListInput : PagedInputDto
{
    public bool? AuditedMark { get; set; }

    public string? Title { get; set; }
}
public class GetMyAuditPageListOutput : EntityDto<Guid>
{
    public string WorkflowDefinitionId { get; set; } = default!;

    public Guid WorkflowId { get; set; }

    public int Version { get; set; }

    public int StepId { get; set; }

    public string? ExecutionPointerId { get; set; }

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

    public EnumAuditStatus Status { get; set; }

    public DateTime? AuditTime { get; set; }

}