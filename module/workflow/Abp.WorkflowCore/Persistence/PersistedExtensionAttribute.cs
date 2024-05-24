using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Volo.Abp.Domain.Entities;

namespace Abp.WorkflowCore.Persistence;

[Table("WorkflowExtensionAttributes")]
public class PersistedExtensionAttribute : Entity<long>
{
    public string ExecutionPointerId { get; set; }

    [ForeignKey("ExecutionPointerId")]
    public PersistedExecutionPointer ExecutionPointer { get; set; }

    [MaxLength(100)]
    public string AttributeKey { get; set; }

    public string AttributeValue { get; set; }
}