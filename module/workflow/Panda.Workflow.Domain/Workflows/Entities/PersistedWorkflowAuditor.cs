using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Abp.WorkflowCore.Persistence;
using Panda.Workflow.Domain.Shared.Enums;
using Volo.Abp.Domain.Entities.Auditing;
using Volo.Abp.MultiTenancy;

namespace Panda.Workflow.Domain.Workflows.Entities;

[Table("WorkflowAuditors")]
public class PersistedWorkflowAuditor : CreationAuditedEntity<Guid>, IMultiTenant
{
    public Guid WorkflowId { get; set; }

    [ForeignKey("WorkflowId")]
    public PersistedWorkflow Workflow { get; set; }
        
    public string? ExecutionPointerId { get; set; }

    [ForeignKey("ExecutionPointerId")]
    public PersistedExecutionPointer ExecutionPointer { get; set; }

    /// <summary>
    /// 状态
    /// </summary>
    public EnumAuditStatus Status { get; set; }
    /// <summary>
    /// 审核时间
    /// </summary>
    public DateTime? AuditTime { get; set; }

    /// <summary>
    /// 备注
    /// </summary>
    [MaxLength(500)]
    public string? Remark { get; set; }

    /// <summary>
    /// 审核人Id
    /// </summary>
    public Guid UserId { get; set; }

    /// <summary>
    /// 审核人
    /// </summary>
    public string? UserIdentityName { get; set; }

    /// <summary>
    /// 头像
    /// </summary>
    public string? UserHeadPhoto { get; set; }
        
    public Guid? TenantId { get; set; }
}