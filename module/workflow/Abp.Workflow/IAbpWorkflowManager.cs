using Volo.Abp.Domain.Services;

namespace Abp.Workflow;

public interface IAbpWorkflowManager : IDomainService
{
    Task<bool> TerminateWorkflow(string workflowId);

    IEnumerable<AbpWorkflowStepBody> GetAllStepBodys();

    Task PublishEventAsync(string eventName, string eventKey, object? eventData);

    Task CreateAsync(PersistedWorkflowDefinition entity);

    Task DeleteAsync(string workflowId);

    Task UpdateAsync(PersistedWorkflowDefinition entity);

    Task StartWorlflow(string id, int version, Dictionary<string, object> inputs);
}