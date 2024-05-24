using Panda.Workflow.Application.Contracts;
using Volo.Abp.AspNetCore;
using Volo.Abp.Modularity;

namespace Panda.Workflow.HttpApi;

[DependsOn(
    typeof(WorkflowApplicationContractsModule),
    typeof(AbpAspNetCoreModule)
)]
public class WorkflowHttpApiModule : AbpModule;