using System.ComponentModel.DataAnnotations.Schema;
using Volo.Abp.Domain.Entities.Auditing;
using Volo.Abp.MultiTenancy;

namespace Abp.Workflow;

/// <summary>
/// 工作流定义
/// </summary>
[Table("WorkflowDefinitions")]
public class PersistedWorkflowDefinition : FullAuditedEntity<string>, IMultiTenant
{
    public PersistedWorkflowDefinition(string id, 
        string title,
        int version, 
        IEnumerable<IEnumerable<IEnumerable<WorkflowFormData>>> inputs, 
        IEnumerable<WorkflowNode> nodes, string group, Guid? tenantId = null)
        : base(id)
    {
        Title = title;
        Version = version;
        Inputs = inputs;
        Nodes = nodes;
        Group = group;
        TenantId = tenantId;
    }

    public Guid? TenantId { get; }

    public string Title { get; set; }

    public int Version { get; set; }

    public string? Description { get; set; }

    public string? Icon { get; set; }

    public string? Color { get; set; }

    public string Group { get; set; }

    public IEnumerable<IEnumerable<IEnumerable<WorkflowFormData>>> Inputs { get; set; }

    public IEnumerable<WorkflowNode> Nodes { get; set; }
}