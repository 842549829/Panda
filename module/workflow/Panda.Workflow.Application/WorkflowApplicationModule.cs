using Abp.Workflow;
using Microsoft.Extensions.DependencyInjection;
using Panda.Net;
using Panda.Workflow.Application.Contracts;
using Panda.Workflow.Application.Workflows.StepBodys;
using Panda.Workflow.Domain;
using Volo.Abp;
using Volo.Abp.AutoMapper;
using Volo.Abp.Modularity;

namespace Panda.Workflow.Application;

[DependsOn(
    typeof(WorkflowDomainModule),
    typeof(WorkflowApplicationContractsModule),
    typeof(NetApplicationModule)
)]
public class WorkflowApplicationModule : AbpModule
{
    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        Configure<AbpAutoMapperOptions>(options =>
        {
            options.AddMaps<WorkflowApplicationModule>();
        });
    }

    public override void OnPreApplicationInitialization(ApplicationInitializationContext context)
    {
        base.OnPreApplicationInitialization(context);
        var abpStepBodyConfiguration  = context.ServiceProvider.GetRequiredService<IAbpStepBodyConfiguration>();
        abpStepBodyConfiguration.Providers.Add<DefaultStepBodyProvider>();
    }
}