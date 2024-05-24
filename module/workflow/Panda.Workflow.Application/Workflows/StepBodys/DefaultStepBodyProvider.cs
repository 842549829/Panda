using Abp.Workflow;
using Panda.Workflow.Application.Inputs;

namespace Panda.Workflow.Application.Workflows.StepBodys;

public class DefaultStepBodyProvider : AbpStepBodyProvider
{
    public override void Build(IAbpStepBodyDefinitionContext context)
    {
        BuildGeneralAuditingStepBody(context);

        BuildRoleAuditingStepBody(context);
    }

    private static void BuildGeneralAuditingStepBody(IAbpStepBodyDefinitionContext context)
    {
        var step = new AbpWorkflowStepBody
        {
            Name = "FixedUserAudit",
            DisplayName = "指定用户审核",
            StepBodyType = typeof(GeneralAuditingStepBody)
        };
        step.Inputs.Add(new WorkflowParam
        {
            InputType = new SelectUserInputType(),
            Name = "UserId",
            DisplayName = "审核人"
        });
        context.Create(step);
    }

    private static void BuildRoleAuditingStepBody(IAbpStepBodyDefinitionContext context)
    {
        var step = new AbpWorkflowStepBody
        {
            Name = "FixedRoleAudit",
            DisplayName = "指定角色审核",
            StepBodyType = typeof(RoleAuditingStepBody)
        };
        step.Inputs.Add(new WorkflowParam
        {
            InputType = new SelectRoleInputType(),
            Name = "RoleName",
            DisplayName = "审核角色名"
        });
        context.Create(step);
    }
}