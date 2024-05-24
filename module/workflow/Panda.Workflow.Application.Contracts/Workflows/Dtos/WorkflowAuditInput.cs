using System.ComponentModel.DataAnnotations;

namespace Panda.Workflow.Application.Contracts.Workflows.Dtos;

public class WorkflowAuditInput
{
    public string ExecutionPointerId { get; set; }

    public bool Pass { get; set; }
    [MaxLength(500)]
    public string Remark { get; set; }

}