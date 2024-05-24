using Abp.Workflow;
using Abp.WorkflowCore.Persistence;
using Abp.WorkflowCore.Persistence.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Panda.Workflow.Application.Contracts.Workflows;
using Panda.Workflow.Application.Contracts.Workflows.Dtos;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Entities;
using Volo.Abp.Domain.Repositories;
using Volo.Abp.Users;

namespace Panda.Workflow.Application.Workflows;

public class WorkflowAppService
    : CrudAppService<PersistedWorkflowDefinition,
        WorkflowDesignInfo,
        string,
        WorkflowListInput,
        WorkflowDesignInfo,
        WorkflowDesignInfo>,
        IWorkflowAppService

{
    private readonly IAbpWorkflowManager _abpWorkflowManager;
    private readonly IRepository<PersistedWorkflow, Guid> _workflowRepository;

    public WorkflowAppService(IRepository<PersistedWorkflowDefinition, string> repository,
        IAbpWorkflowManager abpWorkflowManager,
        IRepository<PersistedWorkflow, Guid> workflowRepository) : base(repository)
    {
        _abpWorkflowManager = abpWorkflowManager;
        _workflowRepository = workflowRepository;
    }

    /// <summary>
    /// 获取所有分组
    /// </summary>
    /// <returns>获取所有分组</returns>
    public async Task<IEnumerable<string>> GetAllGroupAsync()
    {
        var data = (await Repository.GetQueryableAsync()).GroupBy(u => u.Group)
            .Select(u => u.Key)
            .Where(u => u != string.Empty)
            .ToList();
        return data;
    }

    /// <summary>
    /// 我发起的流程
    /// </summary>
    /// <param name="input">查询参数</param>
    /// <returns>结果列表</returns>
    public async Task<PagedResultDto<MyWorkflowListOutput>> GetMyWorkflowAsync(WorkflowListInput input)
    {
        var query = await CreatePersistedWorkflowFilteredQueryAsync(input);
        var totalCount = await query.CountAsync();
        query = query
            .OrderByDescending(u => u.CreationTime)
            .PageBy(input.SkipCount, input.MaxResultCount);
        var items = (await query.ToListAsync())
            .Select(MapToGetListOutputDto)
            .ToList();
        return new PagedResultDto<MyWorkflowListOutput>(totalCount, items);
    }

    /// <summary>
    /// 获取所有的步骤
    /// </summary>
    /// <returns>结果</returns>
    public IEnumerable<AbpWorkflowStepBody> GetAllStepBodys()
    {
        return _abpWorkflowManager.GetAllStepBodys();
    }

    /// <summary>
    /// 获取所有分组的流程
    /// </summary>
    /// <param name="input">查询条件</param>
    /// <returns>结果</returns>
    public async Task<Dictionary<string, IEnumerable<WorkflowDesignInfo>>> GetAllWithGroupAsync(WorkflowListInput input)
    {
        var list = (await (await CreateFilteredQueryAsync(input)).ToListAsync()).Select(u => u);
        return list.GroupBy(u => u.Group)
            .OrderBy(i => i.Key)
            .ToDictionary(u => u.Key,
                u => u.Select(i => ObjectMapper.Map<PersistedWorkflowDefinition, WorkflowDesignInfo>(i)));
    }

    /// <summary>
    /// 获取单个流程定义
    /// </summary>
    /// <param name="id">id</param>
    /// <returns>结果</returns>
    public override Task<WorkflowDesignInfo> GetAsync(string id)
    {
        return base.GetAsync(id);
    }

    /// <summary>
    /// 创建流程定义
    /// </summary>
    /// <param name="input">创建参数</param>
    /// <returns>结果</returns>
    public override async Task<WorkflowDesignInfo> CreateAsync(WorkflowDesignInfo input)
    {
        var entity = await MapToEntityAsync(input);
        TrySetId(entity, GuidGenerator.Create().ToString());
        await _abpWorkflowManager.CreateAsync(entity);
        return await MapToGetOutputDtoAsync(entity);
    }

    /// <summary>
    /// 获取流程列表
    /// </summary>
    /// <param name="input">查询条件</param>
    /// <returns>结果</returns>
    public override async Task<PagedResultDto<WorkflowDesignInfo>> GetListAsync(WorkflowListInput input)
    {
        return await base.GetListAsync(input);
    }

    /// <summary>
    /// 更新流程定义
    /// </summary>
    /// <param name="id">id</param>
    /// <param name="input">更新参数</param>
    /// <returns>结果</returns>
    public override async Task<WorkflowDesignInfo> UpdateAsync(string id, WorkflowDesignInfo input)
    {
        var entity = await MapToEntityAsync(input);
        TrySetId(entity, id);
        await _abpWorkflowManager.UpdateAsync(entity);
        return await MapToGetOutputDtoAsync(entity);
    }

    /// <summary>
    /// 启动工作流
    /// </summary>
    /// <param name="input">请求参数</param>
    /// <returns>标识异步</returns>
    public async Task StartAsync(StartWorkflowInput input)
    {
        await _abpWorkflowManager.StartWorlflow(input.Id, input.Version, input.Inputs);
    }

    /// <summary>
    /// 获取详情
    /// </summary>
    /// <param name="id">待审核ID</param>
    /// <returns>结果</returns>
    public async Task<WorkflowDto> GetDetailsAsync(Guid id)
    {
        var query = await _workflowRepository.GetQueryableAsync();
        var temp = await query.Where(u => u.Id == id)
            .OrderByDescending(a => a.Version)
            .Select(u => new
            {
                u.Id,
                u.Version,
                u.WorkflowDefinitionId,
                u.WorkflowDefinition.Title,
                u.CreateUserIdentityName,
                u.CreationTime,
                u.WorkflowDefinition.Inputs,
                u.Data,
                u.CompleteTime,
                u.Status,
                u.WorkflowDefinition.Nodes,
                ExecutionRecords = u.ExecutionPointers.OrderBy(i => i.StartTime).Select(i => new WorkflowExecutionRecord
                {
                    ExecutionPointerId = i.Id,
                    EndTime = i.EndTime,
                    StartTime = i.StartTime,
                    StepId = i.StepId,
                    StepName = i.StepName
                })
            }).FirstAsync();
        var result = new WorkflowDto
        {
            Id = temp.Id,
            Data = temp.Data.FromJsonString<Dictionary<string, object>>(),
            CompleteTime = temp.CompleteTime,
            Status = temp.Status,
            Title = temp.Title,
            CreationTime = temp.CreationTime,
            UserName = temp.CreateUserIdentityName,
            Version = temp.Version,
            WorkflowDefinitionId = temp.WorkflowDefinitionId,
            Inputs = temp.Inputs,
            ExecutionRecords = temp.ExecutionRecords
        };
        foreach (var item in result.ExecutionRecords)
        {
            item.StepTitle = temp.Nodes.FirstOrDefault(i => i.Key == item.StepName)?.Title;
        }
        return result;
    }

    /// <summary>
    /// 发布事件
    /// </summary>
    /// <param name="input">发布参数</param>
    /// <returns>标识异步</returns>
    public async Task PublicEventAsync(PublishEventInput input)
    {
        await _abpWorkflowManager.PublishEventAsync(input.EventName, input.EventKey, input.EventData);
    }

    /// <summary>
    /// 获取具体的某个流程定义
    /// </summary>
    /// <param name="id">id</param>
    /// <param name="version">版本号</param>
    /// <returns>结果</returns>
    public Task<WorkflowDesignInfo> GetAsync(string id, int version)
    {
        throw new NotImplementedException();
    }

    /// <summary>
    /// 删除
    /// </summary>
    /// <param name="id">id</param>
    /// <returns>标识异步</returns>
    public override async Task DeleteAsync(string id)
    {
        await _abpWorkflowManager.DeleteAsync(id);
    }

    protected override async Task<IQueryable<PersistedWorkflowDefinition>> CreateFilteredQueryAsync(WorkflowListInput input)
    {
        var query = await base.CreateFilteredQueryAsync(input);
        return query.WhereIf(!input.Title.IsNullOrEmpty(), u => u.Title.Contains(input.Title!));
    }

    private static MyWorkflowListOutput MapToGetListOutputDto(PersistedWorkflow entity)
    {
        return new MyWorkflowListOutput
        {
            Title = entity.WorkflowDefinition.Title,
            Version = entity.Version,
            Id = entity.Id,
            Status = entity.Status,
            CompleteTime = entity.CompleteTime,
            CreationTime = entity.CreationTime,
            CurrentStepName = entity.ExecutionPointers.OrderBy(i => i.StepId).Last().StepName,
            Nodes = entity.WorkflowDefinition.Nodes
        };
    }

    private async Task<IQueryable<PersistedWorkflow>> CreatePersistedWorkflowFilteredQueryAsync(WorkflowListInput input)
    {
        var query = await _workflowRepository.GetQueryableAsync();
        return query
            .Include(a => a.ExecutionPointers)
            .Include(a => a.WorkflowDefinition)
            .Where(u => u.CreatorId == CurrentUser.GetId())
            .WhereIf(!input.Title.IsNullOrEmpty(), u => u.WorkflowDefinition.Title.Contains(input.Title!));
    }

    private static void TrySetId(IEntity<string> entity, string id)
    {
        if (!entity.Id.IsNullOrWhiteSpace())
        {
            return;
        }
        EntityHelper.TrySetId(entity, () => id, true);
    }
}