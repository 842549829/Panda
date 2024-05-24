using Panda.Workflow.Domain.Shared.Base;

namespace Panda.Workflow.Application.Contracts.Workflows.Dtos;

public class WorkflowListInput : PagedInputDto
{
    public string? Title { get; set; }
}