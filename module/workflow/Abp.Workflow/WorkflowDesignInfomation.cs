namespace Abp.Workflow;

public class WorkflowFormData
{
    public string Id { get; set; } = default!;

    public string Name { get; set; } = default!;

    public string Label { get; set; } = default!;

    public string Type { get; set; } = default!;

    public object? Value { get; set; }

    public IEnumerable<object> Styles { get; set; } = new List<object>();

    public int? MaxLength { get; set; }

    public int? MinLength { get; set; }

    public IEnumerable<object> Items { get; set; } = new List<object>();

    public IEnumerable<object> Rules { get; set; } = new List<object>();
}

public class WorkflowNode
{
    public string Key { get; set; } = default!;

    public string Title { get; set; } = default!;

    public int[] Position { get; set; } = default!;

    public string Type { get; set; } = default!;

    public AbpStepBodyInput StepBody { get; set; } = new();

    public IEnumerable<string> ParentNodes { get; set; } = default!;

    public IEnumerable<WorkflowConditionNode> NextNodes { get; set; } = new List<WorkflowConditionNode>();
}

public class AbpStepBodyInput
{
    public string? Name { get; set; } = default!;

    public Dictionary<string, WorkflowParamInput> Inputs { get; set; } = new();
}

public class WorkflowParamInput
{
    public string Name { get; set; } = default!;

    public object Value { get; set; } = default!;
}

public class WorkflowConditionNode
{
    public string Label { get; set; } = default!;

    public string NodeId { get; set; } = default!;

    public IEnumerable<WorkflowConditionCondition> Conditions { get; set; } = new List<WorkflowConditionCondition>();
}

public class WorkflowConditionCondition
{
    public string Field { get; set; } = default!;

    public string Operator { get; set; } = default!;

    public object Value { get; set; } = default!;
}