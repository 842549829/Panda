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
using Volo.Abp.Identity;
using WorkflowCore.Interface;
using WorkflowCore.Models;

namespace Panda.Workflow.Application.Workflows.StepBodys;

public class RoleAuditingStepBody(IDistributedEventBus distributedEventBus,
    IAbpPersistenceProvider abpPersistenceProvider,
    IUserManager userManager,
    IRepository<PersistedWorkflowAuditor> auditorRepository)
    : StepBodyBase, ITransientDependency
{
    /// <summary>
    /// 审核角色
    /// </summary>
    public string RoleName { get; set; } = default!;

    public override async Task<ExecutionResult> RunAsync(IStepExecutionContext context)
    {
        var userIdentitys = await userManager.GetUsersInRoleAsync(RoleName);
        if (!userIdentitys.Any())
        {
            context.Workflow.Status = WorkflowStatus.Complete;
            return ExecutionResult.Next();
        }

        if (!context.ExecutionPointer.EventPublished)
        {
            var workflow = await abpPersistenceProvider.GetPersistedWorkflowAsync(new Guid(context.Workflow.Id));
            var workflowDefinition = await abpPersistenceProvider.GetPersistedWorkflowDefinitionAsync(context.Workflow.WorkflowDefinitionId, context.Workflow.Version);
            var userIdentityName = await GetUserIdentityNameAsync(workflow);

            //通知审批人
            await NotificationAsync(workflow, userIdentityName, userIdentitys, workflowDefinition);

            //添加审核人记录
            await InsertAuditUserInfoAsync(context, userIdentitys, workflow);

            return ExecutionResult.WaitForEvent(ActionName, Guid.NewGuid().ToString(), DateTime.MinValue);
        }

        var pass = (await auditorRepository.GetQueryableAsync()).Count(u => u.ExecutionPointerId == context.ExecutionPointer.Id && u.Status == EnumAuditStatus.Pass);

        //需全部审核通过
        if (pass < userIdentitys.Count)
        {
            context.Workflow.Status = WorkflowStatus.Complete;
        }
        return ExecutionResult.Next();
    }

    private async Task InsertAuditUserInfoAsync(IStepExecutionContext context,
        List<IdentityUser> userIdentitys,
        PersistedWorkflow workflow)
    {
        var persistedWorkflowAuditors = userIdentitys
            .Select(item => new PersistedWorkflowAuditor
            {
                WorkflowId = workflow.Id,
                ExecutionPointerId = context.ExecutionPointer.Id,
                Status = EnumAuditStatus.UnAudited,
                UserIdentityName = item.Name,
                UserId = item.Id,
                TenantId = item.TenantId
            })
            .ToList();
        await auditorRepository.InsertManyAsync(persistedWorkflowAuditors);
    }

    private async Task NotificationAsync(PersistedWorkflow workflow,
        string userIdentityName,
        List<IdentityUser> userIdentitys,
        PersistedWorkflowDefinition workflowDefinition)
    {
        await distributedEventBus.PublishAsync(new WorkflowNotificationEto
        {
            TenantId = workflow.TenantId,
            UserIds = userIdentitys.Select(a => a.Id).ToList(),
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
}