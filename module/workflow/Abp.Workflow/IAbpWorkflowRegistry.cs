namespace Abp.Workflow;

public interface IAbpWorkflowRegistry
{
    void RegisterWorkflow(Type type);
}