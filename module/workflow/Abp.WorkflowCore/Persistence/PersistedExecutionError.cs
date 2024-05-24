using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Volo.Abp.Domain.Entities;

namespace Abp.WorkflowCore.Persistence;

[Table("WorkflowExecutionErrors")]
public class PersistedExecutionError : Entity<Guid>
{
    [MaxLength(100)]
    public string WorkflowId { get; set; }

    [MaxLength(100)]
    public string ExecutionPointerId { get; set; }

    public DateTime ErrorTime { get; set; }

    public string Message { get; set; }
}