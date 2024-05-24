using System.Text.Json.Serialization;

namespace Abp.Workflow;

public class AbpWorkflowStepBody
{
    public string Name { get; set; } = default!;

    public string DisplayName { get; set; } = default!;

    public WorkflowParamDictionary Inputs { get; set; } = new();

    [JsonConverter(typeof(TypeJsonConverter))]
    public Type StepBodyType { get; set; } = default!;
}