using Volo.Abp.Modularity;

namespace Abp.WorkflowCore.Persistence.EntityFrameworkCore;

[DependsOn(typeof(AbpWorkflowCoreModule))]
public class AbpWorkflowCoreEfCoreModule : AbpModule
{
}