using Abp.Workflow;
using Volo.Abp;
using Volo.Abp.Domain.Repositories;
using Volo.Abp.Domain.Services;
using Volo.Abp.Json;
using Volo.Abp.Uow;
using WorkflowCore.DSL.Interface;
using WorkflowCore.DSL.Models.v1;
using WorkflowCore.DSL.Services;
using WorkflowCore.Interface;
using WorkflowCore.Models;

namespace Abp.WorkflowCore;

public class AbpWorkflowManager : DomainService, IAbpWorkflowManager
{
    private readonly IWorkflowHost _workflowHost;
    private readonly IWorkflowController _workflowService;
    private readonly IWorkflowRegistry _registry;
    private readonly IDefinitionLoader _definitionLoader;
    private readonly IRepository<PersistedWorkflowDefinition, string> _workflowDefinitionRepository;

    protected IReadOnlyCollection<AbpWorkflowStepBody> StepBodys;

    public IAbpPersistenceProvider PersistenceProvider { get; }

    public async Task<IQueryable<PersistedWorkflowDefinition>> GetWorkflowDefinitionsAsync()
    {
        return await _workflowDefinitionRepository.GetQueryableAsync();
    }

    public AbpWorkflowManager(WorkflowDefinitionManager workflowDefinitionManager,
        IWorkflowHost workflowHost,
        IWorkflowController workflowService,
        IWorkflowRegistry registry,
        IAbpPersistenceProvider workflowStore,
        IDefinitionLoader definitionLoader,
        IRepository<PersistedWorkflowDefinition, string> workflowDefinitionRepository)
    {
        _workflowHost = workflowHost;
        _workflowService = workflowService;
        _registry = registry;
        PersistenceProvider = workflowStore;
        _definitionLoader = definitionLoader;
        _workflowDefinitionRepository = workflowDefinitionRepository;
        StepBodys = workflowDefinitionManager.GetAllStepBodys();
    }

    /// <summary>
    /// 终止流程
    /// </summary>
    /// <param name="workflowId">流程Id</param>
    /// <returns>结果</returns>
    public virtual async Task<bool> TerminateWorkflow(string workflowId)
    {
        return await _workflowService.TerminateWorkflow(workflowId);
    }

    public IEnumerable<AbpWorkflowStepBody> GetAllStepBodys()
    {
        return StepBodys;
    }

    public virtual async Task PublishEventAsync(string eventName, string eventKey, object? eventData)
    {
        await _workflowHost.PublishEvent(eventName, eventKey, eventData);
    }

    public virtual async Task CreateAsync(PersistedWorkflowDefinition entity)
    {
        LoadDefinition(entity);
        await _workflowDefinitionRepository.InsertAsync(entity);
    }

    public virtual async Task DeleteAsync(string workflowId)
    {
        var entity = await _workflowDefinitionRepository.GetAsync(workflowId);
        var all = await PersistenceProvider.GetAllRunnablePersistedWorkflowAsync(entity.Id, entity.Version);
        if (all.Any())
        {
            throw new UserFriendlyException("删不了！！还有没有执行完的流程！");
        }
        if (_registry.IsRegistered(entity.Id, entity.Version))
        {
            _registry.DeregisterWorkflow(entity.Id, entity.Version);
        }
        await _workflowDefinitionRepository.DeleteAsync(entity);
    }

    public virtual async Task UpdateAsync(PersistedWorkflowDefinition entity)
    {
        if (_registry.IsRegistered(entity.Id, entity.Version))
        {
            _registry.DeregisterWorkflow(entity.Id, entity.Version);
        }

        LoadDefinition(entity);
        await _workflowDefinitionRepository.UpdateAsync(entity);
    }

    public virtual async Task StartWorlflow(string id, int version, Dictionary<string, object> inputs)
    {
        if (!_registry.IsRegistered(id, version))
        {
            throw new UserFriendlyException("the workflow  has not been defined!");
        }
        await _workflowHost.StartWorkflow(id, version, inputs);
    }

    /// <summary>
    ///  初始化注册流程
    /// </summary>
    internal async Task Initialize()
    {
        var unit = LazyServiceProvider.LazyGetRequiredService<IUnitOfWorkManager>();
        using (unit.Begin())
        {
            var workflows = (await GetWorkflowDefinitionsAsync()).ToList();
            foreach (var workflow in workflows)
            {
                LoadDefinition(workflow);
            }
        }
    }

    /// <summary>
    /// 注册工作流
    /// </summary>
    /// <param name="input">实体工作流定义</param>
    /// <returns>框架工作流定义</returns>
    internal WorkflowDefinition LoadDefinition(PersistedWorkflowDefinition input)
    {
        if (_registry.IsRegistered(input.Id, input.Version))
        {
            throw new AbpException($"the workflow {input.Id} has ben definded!");
        }

        var source = new DefinitionSourceV1
        {
            Id = input.Id,
            Version = input.Version,
            Description = input.Title,
            DataType = $"{typeof(Dictionary<string, object>).FullName}, {typeof(Dictionary<string, object>).Assembly.FullName}",
        };

        BuildWorkflow(input.Nodes.ToList(), source, StepBodys.ToList(), input.Nodes.First(u => u.Key.ToLower().StartsWith("start")));

        var jsonSerializer = LazyServiceProvider.LazyGetRequiredService<IJsonSerializer>();
        var json = jsonSerializer.Serialize(source);
        var def = _definitionLoader.LoadDefinition(json, Deserializers.Json);
        return def;
    }

    protected virtual void BuildWorkflow(List<WorkflowNode> allNodes,
        DefinitionSourceV1 source,
        List<AbpWorkflowStepBody> stepBodys,
        WorkflowNode node)
    {
        if (source.Steps.Any(u => u.Id == node.Key))
        {
            return;
        }
        var stepbody = stepBodys.FirstOrDefault(u => u.Name == node.StepBody.Name) ?? new AbpWorkflowStepBody
        {
            StepBodyType = typeof(NullStepBody)
        };
        var stepSource = new StepSourceV1
        {
            Id = node.Key,
            Name = node.Key,
            StepType = $"{stepbody.StepBodyType.FullName}, {stepbody.StepBodyType.Assembly.FullName}"
        };
        foreach (var input in stepbody.Inputs)
        {
            var value = node.StepBody.Inputs[input.Key].Value;
            if (value is not (IDictionary<string, object> or IDictionary<object, object>))
            {
                value = $"\"{value}\"";
            }
            stepSource.Inputs.TryAdd(input.Key, value);
        }
        source.Steps.Add(stepSource);
        BuildBranching(allNodes, source, stepSource, stepBodys, node.NextNodes);
    }

    protected virtual void BuildBranching(List<WorkflowNode> allNodes,
        DefinitionSourceV1 source,
        StepSourceV1 stepSource,
        List<AbpWorkflowStepBody> stepBodys,
        IEnumerable<WorkflowConditionNode> nodes)
    {
        foreach (var nextNode in nodes)
        {
            var node = allNodes.First(u => u.Key == nextNode.NodeId);
            stepSource.SelectNextStep[nextNode.NodeId] = "1==1";
            if (nextNode.Conditions.Any())
            {
                var exps = new List<string>();
                foreach (var condition in nextNode.Conditions)
                {
                    if (condition.Value is string
                        && !decimal.TryParse(condition.Value.ToString(), out _))
                    {
                        if (condition.Operator != "==" && condition.Operator != "!=")
                        {
                            throw new AbpException($" if {condition.Field} is type of 'String', the Operator must be \"==\" or \"!=\"");
                        }
                        exps.Add($"data[\"{condition.Field}\"].ToString() {condition.Operator} \"{condition.Value}\"");
                        continue;
                    }
                    exps.Add($"decimal.Parse(data[\"{condition.Field}\"].ToString()) {condition.Operator} {condition.Value}");
                }
                stepSource.SelectNextStep[nextNode.NodeId] = string.Join(" && ", exps);
            }

            BuildWorkflow(allNodes, source, stepBodys, node);
        }
    }
}