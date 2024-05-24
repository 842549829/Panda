using Abp.Workflow;
using Volo.Abp.Application.Dtos;

namespace Panda.Workflow.Application.Contracts.Workflows.Dtos;

public class WorkflowDesignInfo : EntityDto<string>
{
    public string Color { get; set; } = default!;

    public string Group { get; set; } = default!;

    public string Icon { get; set; } = default!;

    public string Title { get; set; } = default!;

    public int Version { get; set; } = 1;

    public string Description { get; set; } = string.Empty;

    public IEnumerable<IEnumerable<IEnumerable<WorkflowFormData>>> Inputs { get; set; } = new List<IEnumerable<IEnumerable<WorkflowFormData>>>();

    public IEnumerable<WorkflowNode> Nodes { get; set; } = new List<WorkflowNode>();
   
}