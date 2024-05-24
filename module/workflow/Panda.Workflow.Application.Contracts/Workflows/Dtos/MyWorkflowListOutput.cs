using System.Text.Json.Serialization;
using Abp.Workflow;
using Volo.Abp.Application.Dtos;
using WorkflowCore.Models;

namespace Panda.Workflow.Application.Contracts.Workflows.Dtos;

public class MyWorkflowListOutput : EntityDto<Guid>
{
    public string Title { get; set; }
    public int Version { get; set; }
    public DateTime CreationTime { get; set; }
    public DateTime? CompleteTime { get; set; }
    public WorkflowStatus Status { get; set; }
    public string? CurrentStepName { get; set; }
    public string? CurrentStepTitle
    {
        get
        {
            return Nodes.FirstOrDefault(i => i.Key == CurrentStepName)?.Title;
        }
    }
    [JsonIgnore]
    public IEnumerable<WorkflowNode> Nodes { get; set; }

}