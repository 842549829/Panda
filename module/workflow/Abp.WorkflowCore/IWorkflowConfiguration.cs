using Volo.Abp.Collections;
using Volo.Abp.DependencyInjection;

namespace Abp.WorkflowCore;

public interface IWorkflowConfiguration
{
    ITypeList<AbpWorkflowProvider> Providers { get; }
}

internal class WorkflowConfiguration : IWorkflowConfiguration, ISingletonDependency
{
    public ITypeList<AbpWorkflowProvider> Providers { get; } = new TypeList<AbpWorkflowProvider>();
}