namespace Panda.Workflow.Application.Contracts.Workflows.Dtos;

public class StartWorkflowInput
{
    public string Id { get; set; }
    public int Version { get; set; }
    public Dictionary<string, object> Inputs { get; set; } = new Dictionary<string, object>();
}