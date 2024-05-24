using WorkflowCore.Interface;
using WorkflowCore.Models;

namespace Panda.Workflow.Application.Workflows.StepBodys;

public abstract class StepBodyBase : IStepBody
{
    public const string ActionName = "AuditEvent";

    public abstract Task<ExecutionResult> RunAsync(IStepExecutionContext context);

    protected ExecutionResult OutcomeResult(object value) => new()
    {
        Proceed = true,
        OutcomeValue = value
    };

    protected ExecutionResult PersistResult(object persistenceData) => new()
    {
        Proceed = false,
        PersistenceData = persistenceData
    };

    protected ExecutionResult SleepResult(object persistenceData, TimeSpan sleep) => new()
    {
        Proceed = false,
        PersistenceData = persistenceData,
        SleepFor = sleep
    };
}