using Panda.Net;
using Panda.Workflow.Domain.Shared;
using Volo.Abp.Modularity;
using Volo.Abp.ObjectExtending;

namespace Panda.Workflow.Application.Contracts;

[DependsOn(
    typeof(WorkflowDomainSharedModule),
    typeof(AbpObjectExtendingModule),
    typeof(NetApplicationContractsModule)
)]
public class WorkflowApplicationContractsModule : AbpModule;