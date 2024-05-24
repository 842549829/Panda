using Volo.Abp;
using Volo.Abp.DependencyInjection;

namespace Abp.Workflow;

public interface IAbpStepBodyDefinitionContext
{
    void Create(AbpWorkflowStepBody entity);
}


/// <summary>
/// 不能继承DomainService基类 因为继承该类则生命周期变成瞬时会导致AbpStepBodys数据为0
/// </summary>
public abstract class AbpStepBodyDefinitionContextBase : IAbpStepBodyDefinitionContext
{
    /// <summary>
    /// 属性依赖注入 
    /// </summary>
    public IAbpLazyServiceProvider LazyServiceProvider { get; set; } = default!;

    protected readonly Dictionary<string, AbpWorkflowStepBody> AbpStepBodys = new();

    public void Create(AbpWorkflowStepBody entity)
    {
        if (AbpStepBodys.ContainsKey(entity.Name))
        {
            throw new AbpException("There is already a AbpStepBody with name: " + entity.Name);
        }
        AbpStepBodys[entity.Name] = entity;
    }

    public IReadOnlyCollection<AbpWorkflowStepBody> GetAllStepBodys()
    {
        return AbpStepBodys.Values;
    }

    public AbpWorkflowStepBody? GetStepBodyOrNull(string name)
    {
        return AbpStepBodys.GetOrDefault(name);
    }

    public void RemoveStepBody(string name)
    {
        AbpStepBodys.Remove(name);
    }
}