using Abp.Workflow;
using Volo.Abp;
using Volo.Abp.DependencyInjection;
using WorkflowCore.Interface;

namespace Abp.WorkflowCore;

public class AbpWorkflowRegistry : IAbpWorkflowRegistry, ISingletonDependency
{
    private readonly IWorkflowRegistry _workflowRegistry;
    private readonly IServiceProvider _serviceProvider;

    public AbpWorkflowRegistry(IWorkflowRegistry workflowRegistry,
        IServiceProvider serviceProvider)
    {
        _workflowRegistry = workflowRegistry;
        _serviceProvider = serviceProvider;
    }

    public void RegisterWorkflow(Type type)
    {
        var workflow = _serviceProvider.GetService(type);
        if (!(workflow is IAbpWorkflow))
        {
            throw new AbpException("RegistType must implement from AbpWorkflow!");
        }
        _workflowRegistry.RegisterWorkflow(workflow as IWorkflow<WorkflowParamDictionary>);
    }
}