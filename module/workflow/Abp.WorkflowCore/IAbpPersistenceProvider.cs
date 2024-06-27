using Abp.Workflow;
using Abp.WorkflowCore.Persistence;
using WorkflowCore.Interface;
using WorkflowCore.Interface.Persistence;

namespace Abp.WorkflowCore;

public interface IAbpPersistenceProvider : IPersistenceProvider
{
    Task<PersistedWorkflow> GetPersistedWorkflowAsync(Guid id);

    Task<IEnumerable<PersistedWorkflow>> GetAllRunnablePersistedWorkflowAsync(string definitionId, int version);

    Task<PersistedExecutionPointer> GetPersistedExecutionPointerAsync(string id);

    Task<PersistedWorkflowDefinition> GetPersistedWorkflowDefinitionAsync(string id, int version);
}