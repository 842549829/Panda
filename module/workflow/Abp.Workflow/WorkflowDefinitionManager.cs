using Microsoft.Extensions.DependencyInjection;
using Volo.Abp.DependencyInjection;

namespace Abp.Workflow;

public class WorkflowDefinitionManager(IAbpStepBodyConfiguration abpStepBodyConfiguration)
    : AbpStepBodyDefinitionContextBase, ISingletonDependency
{
    internal void Initialize()
    {
        var providers = abpStepBodyConfiguration.Providers
            .Select(c => (AbpStepBodyProvider)LazyServiceProvider.GetRequiredService(c))
            .ToList();
        foreach (var provider in providers)
        {
            provider.Build(this);
        }
    }
}