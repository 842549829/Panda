using Microsoft.Extensions.DependencyInjection;
using Volo.Abp;
using Volo.Abp.Modularity;
using Volo.Abp.Validation;

namespace Abp.Workflow;

[DependsOn(typeof(AbpValidationModule))]
public class AbpWorkflowModule : AbpModule
{
    public override void OnApplicationInitialization(ApplicationInitializationContext context)
    {
        base.OnApplicationInitialization(context);
        context.ServiceProvider.GetRequiredService<WorkflowDefinitionManager>()
            .Initialize();
    }
}