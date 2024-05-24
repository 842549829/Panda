using Volo.Abp.DependencyInjection;
using WorkflowCore.Interface;

namespace Abp.WorkflowCore;

public abstract class AbpWorkflowProvider : ITransientDependency
{
    /// <summary>
    /// 设置码表类型
    /// </summary>
    /// <param name="context">IWorkflowBuilder</param>
    public abstract void Builds(IWorkflowBuilder context);
}