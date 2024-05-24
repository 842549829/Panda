using Volo.Abp.Collections;
using Volo.Abp.DependencyInjection;

namespace Abp.Workflow;

public interface IAbpStepBodyConfiguration
{
    ITypeList<AbpStepBodyProvider> Providers { get; }
}

internal class AbpStepBodyConfiguration : IAbpStepBodyConfiguration, ISingletonDependency
{
    public ITypeList<AbpStepBodyProvider> Providers { get; } = new TypeList<AbpStepBodyProvider>();

    public bool IsEnabled { get; set; } = true;
}

public abstract class AbpStepBodyProvider : ITransientDependency
{
    public abstract void Build(IAbpStepBodyDefinitionContext context);
}