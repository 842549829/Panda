using Panda.Net;
using Volo.Abp.Modularity;

namespace Panda.Workflow.Domain.Shared;

[DependsOn(typeof(NetDomainSharedModule))]
public class WorkflowDomainSharedModule : AbpModule;