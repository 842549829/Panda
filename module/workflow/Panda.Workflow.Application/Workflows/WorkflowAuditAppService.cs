using Abp.Workflow;
using Abp.WorkflowCore;
using Microsoft.EntityFrameworkCore;
using Panda.Net.Bases.Users.Managers;
using Panda.Workflow.Application.Contracts.Workflows;
using Panda.Workflow.Application.Contracts.Workflows.Dtos;
using Panda.Workflow.Domain.Shared.Enums;
using Panda.Workflow.Domain.Workflows.Entities;
using Volo.Abp;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Domain.Entities;
using Volo.Abp.Domain.Repositories;
using Volo.Abp.Users;

namespace Panda.Workflow.Application.Workflows;

public class WorkflowAuditAppService : ApplicationService, IWorkflowAuditAppService
{
    private readonly IRepository<PersistedWorkflowAuditor, Guid> _auditorRepos;
    private readonly IAbpWorkflowManager _abpWorkflowManager;
    private readonly IUserManager _userManager;
    private readonly IAbpPersistenceProvider _abpPersistenceProvider;

    public WorkflowAuditAppService(IRepository<PersistedWorkflowAuditor, Guid> auditorRepos,
        IAbpWorkflowManager abpWorkflowManager,
        IUserManager userManager,
        IAbpPersistenceProvider abpPersistenceProvider)
    {
        _auditorRepos = auditorRepos;
        _abpWorkflowManager = abpWorkflowManager;
        _userManager = userManager;
        _abpPersistenceProvider = abpPersistenceProvider;
    }

    /// <summary>
    /// 获取我的审核列表
    /// </summary>
    /// <param name="input">查询条件</param>
    /// <returns>结果</returns>
    public async Task<PagedResultDto<GetMyAuditPageListOutput>> GetListAsync(GetMyAuditPageListInput input)
    {
        var query = await CreateFilteredQueryAsync(input);
        var totalCount = await query.CountAsync();
        query = query
            .OrderByDescending(u => u.CreationTime)
            .PageBy(input.SkipCount, input.MaxResultCount);
        var items = (await query.ToListAsync())
            .Select(MapToGetListOutputDto)
            .ToList();
        return new PagedResultDto<GetMyAuditPageListOutput>(totalCount, items);
    }

    /// <summary>
    /// 获取详情
    /// </summary>
    /// <param name="id">流程ID</param>
    /// <returns>结果</returns>
    public async Task<WorkflowAuditDto> GetAuditRecordsAsync(Guid id)
    {
        var queryable = await _auditorRepos.GetQueryableAsync();
        var query = queryable.Where(u => u.WorkflowId == id)
            .Select(u => new
            {
                u.ExecutionPointerId,
                u.AuditTime,
                u.Status,
                u.Remark,
                u.UserIdentityName,
                u.UserHeadPhoto,
                u.UserId
            });
        var data = await query.ToListAsync();

        //审核记录
        var resords = data.GroupBy(i => i.ExecutionPointerId)
            .Select(u => new
            {
                ExecutionPointerId = u.Key,
                AuditRecords = u.Select(i => new WorkflowAuditRecord()
                {
                    UserId = i.UserId,
                    AuditTime = i.AuditTime,
                    Status = i.Status,
                    Remark = i.Remark,
                    UserIdentityName = i.UserIdentityName,
                    UserHeadPhoto = i.UserHeadPhoto,
                })
            })
            .ToDictionary(i => i.ExecutionPointerId, i => i.AuditRecords);

        return new WorkflowAuditDto
        {
            NeedAudit = data.Any(i => i.UserId == CurrentUser.GetId() && i.Status == EnumAuditStatus.UnAudited),
            AuditRecords = resords
        };
    }

    /// <summary>
    /// 审核
    /// </summary>
    /// <param name="input">审核参数</param>
    /// <returns>结果</returns>
    public async Task AuditAsync(WorkflowAuditInput input)
    {
        var entity = await _auditorRepos.FirstOrDefaultAsync(u => u.ExecutionPointerId == input.ExecutionPointerId && u.UserId == CurrentUser.GetId());
        if (entity == null)
        {
            throw new UserFriendlyException("不需要您审核");
        }
        var user = await _userManager.GetByIdAsync(CurrentUser.GetId());

        entity.Status = input.Pass ? EnumAuditStatus.Pass : EnumAuditStatus.Unapprove;
        entity.Remark = input.Remark;
        entity.AuditTime = DateTime.Now;
        entity.UserIdentityName = user.Name;
        entity.TenantId = user.TenantId;
        await CurrentUnitOfWork?.SaveChangesAsync()!;

        // 拒绝则终止流程
        if (!input.Pass)
        {
            await _abpWorkflowManager.TerminateWorkflow(entity.WorkflowId.ToString());
            return;
        }
        // 如果没有待审核的则继续发布事件通知下一步流程
        if (!(await _auditorRepos.GetQueryableAsync()).Any(u => u.ExecutionPointerId == input.ExecutionPointerId && u.Status == EnumAuditStatus.UnAudited))
        {
            var pointer = await _abpPersistenceProvider.GetPersistedExecutionPointerAsync(input.ExecutionPointerId);
            await _abpWorkflowManager.PublishEventAsync(pointer.EventName!, pointer.EventKey!, null);
        }
    }

    private static GetMyAuditPageListOutput MapToGetListOutputDto(PersistedWorkflowAuditor entity)
    {
        return new GetMyAuditPageListOutput
        {
            Id = entity.Id,
            ExecutionPointerId = entity.ExecutionPointerId,
            CreationTime = entity.Workflow.CreationTime,
            Title = entity.Workflow.WorkflowDefinition.Title,
            UserName = entity.Workflow.CreateUserIdentityName,
            WorkflowDefinitionId = entity.Workflow.WorkflowDefinitionId,
            Version = entity.Workflow.WorkflowDefinition.Version,
            WorkflowId = entity.WorkflowId,
            Status = entity.Status,
            AuditTime = entity.AuditTime
        };
    }

    private async Task<IQueryable<PersistedWorkflowAuditor>> CreateFilteredQueryAsync(GetMyAuditPageListInput input)
    {
        var query = await _auditorRepos.GetQueryableAsync();
        query = query
            .Include(a => a.Workflow)
            .ThenInclude(a => a.WorkflowDefinition)
            .Where(u => u.UserId == CurrentUser.GetId())
            .WhereIf(!input.Title.IsNullOrWhiteSpace(), u => u.Workflow.WorkflowDefinition.Title.Contains(input.Title!))
            .WhereIf(input.AuditedMark.HasValue && input.AuditedMark.Value, u => u.Status != EnumAuditStatus.UnAudited)
            .WhereIf(input.AuditedMark.HasValue && !input.AuditedMark.Value, u => u.Status == EnumAuditStatus.UnAudited);
        return query;
    }
}