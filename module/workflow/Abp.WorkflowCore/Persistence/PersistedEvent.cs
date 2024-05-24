using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Volo.Abp.Domain.Entities.Auditing;
using Volo.Abp.MultiTenancy;

namespace Abp.WorkflowCore.Persistence;

[Table("WorkflowEvents")]
public class PersistedEvent : CreationAuditedEntity<Guid>, IMultiTenant
{
    public Guid? TenantId { get; set; }

    [MaxLength(200)]
    public string? EventName { get; set; }

    [MaxLength(200)]
    public string? EventKey { get; set; }

    public string? EventData { get; set; }

    public DateTime EventTime { get; set; }

    public bool IsProcessed { get; set; }
}