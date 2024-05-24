namespace Abp.Workflow;

public class WorkflowParamDictionary : Dictionary<string, WorkflowParam>
{
    public void Add(WorkflowParam param)
    {
        if (ContainsKey(param.Name))
        {
            throw new ArgumentException($"'{param.Name}' has Contain!");
        }
        this[param.Name] = param;
    }
}