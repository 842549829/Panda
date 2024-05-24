using Abp.Workflow;
using Abp.WorkflowCore;
using Abp.WorkflowCore.Persistence;
using Panda.Net.Bases.Users.Managers;
using Panda.Workflow.Domain.Shared.Enums;
using Panda.Workflow.Domain.Shared.EventData;
using Panda.Workflow.Domain.Workflows.Entities;
using Volo.Abp.Auditing;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Domain.Repositories;
using Volo.Abp.EventBus.Distributed;
using Volo.Abp.Uow;
using WorkflowCore.Interface;
using WorkflowCore.Models;
using IdentityUser = Volo.Abp.Identity.IdentityUser;

namespace Panda.Workflow.Application.Workflows.StepBodys;

public class GeneralAuditingStepBody(IDistributedEventBus distributedEventBus,
        IAbpPersistenceProvider abpPersistenceProvider,
        IUserManager userManager,
        IRepository<PersistedWorkflowAuditor> auditorRepository)
    : StepBodyBase, ITransientDependency
{
    /// <summary>
    /// 审核人
    /// </summary>
    public string UserId { get; set; }

    [UnitOfWork]
    public override async Task<ExecutionResult> RunAsync(IStepExecutionContext context)
    {
        if (!context.ExecutionPointer.EventPublished)
        {
            var workflow = await abpPersistenceProvider.GetPersistedWorkflowAsync(new Guid(context.Workflow.Id));
            var workflowDefinition = await abpPersistenceProvider.GetPersistedWorkflowDefinitionAsync(context.Workflow.WorkflowDefinitionId, context.Workflow.Version);
            var userIdentityName = await GetUserIdentityNameAsync(workflow);

            //通知审批人
            await NotificationAsync(workflow, userIdentityName, workflowDefinition);

            //添加审核人记录
            await InsertAuditUserInfoAsync(context, workflow);

            return ExecutionResult.WaitForEvent(ActionName, Guid.NewGuid().ToString(), DateTime.MinValue);
        }

        var userId = Guid.Parse(UserId);
        var pass = (await auditorRepository.GetQueryableAsync()).Any(u => u.ExecutionPointerId == context.ExecutionPointer.Id && u.UserId == userId && u.Status == EnumAuditStatus.Pass);
        if (!pass)
        {
            context.Workflow.Status = WorkflowStatus.Complete;
        }
        return ExecutionResult.Next();
    }

    private async Task InsertAuditUserInfoAsync(IStepExecutionContext context,
        PersistedWorkflow workflow)
    {
        var userId = Guid.Parse(UserId);
        var auditUserInfo = await userManager.GetByIdAsync(userId);
        await auditorRepository.InsertAsync(CreatePersistedWorkflowAuditor(context, workflow, auditUserInfo));
    }

    private async Task NotificationAsync(PersistedWorkflow workflow,
        string userIdentityName,
        PersistedWorkflowDefinition workflowDefinition)
    {
        var userId = Guid.Parse(UserId);
        await distributedEventBus.PublishAsync(new WorkflowNotificationEto
        {
            TenantId = workflow.TenantId,
            UserIds = new List<Guid> { userId },
            WorkId = workflow.Id,
            Content = $"【{userIdentityName}】提交的{workflowDefinition.Title}需要您审批！"
        });
    }

    private async Task<string> GetUserIdentityNameAsync(IMayHaveCreator creator)
    {
        if (creator == null)
        {
            throw new ArgumentNullException(nameof(creator));
        }

        var userIdentityName = "******";
        if (creator.CreatorId != null)
        {
            userIdentityName = (await userManager.GetByIdAsync(creator.CreatorId.Value)).Name;
        }

        return userIdentityName;
    }

    private PersistedWorkflowAuditor CreatePersistedWorkflowAuditor(IStepExecutionContext context, PersistedWorkflow workflow, IdentityUser auditUserInfo)
    {
        if (auditUserInfo == null)
        {
            throw new ArgumentNullException(nameof(auditUserInfo));
        }

        var userId = Guid.Parse(UserId);
        return new PersistedWorkflowAuditor
        {
            WorkflowId = workflow.Id,
            ExecutionPointerId = context.ExecutionPointer.Id,
            Status = EnumAuditStatus.UnAudited,
            UserId = userId,
            TenantId = workflow.TenantId,
            UserIdentityName = auditUserInfo.Name
        };
    }
}