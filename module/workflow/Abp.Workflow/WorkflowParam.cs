namespace Abp.Workflow;

public class WorkflowParam
{
    public string Name { get; set; }

    public string DisplayName { get; set; }

    public IInputType InputType { get; set; }

    public object Value { get; set; }
}