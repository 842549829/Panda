using Panda.Net;
using Panda.Workflow.Domain.Shared;
using Volo.Abp.AutoMapper;
using Volo.Abp.Modularity;

namespace Panda.Workflow.Domain;

[DependsOn(typeof(WorkflowDomainSharedModule),
    typeof(AbpAutoMapperModule),
    typeof(NetDomainModule))]
public class WorkflowDomainModule : AbpModule;