using Abp.Workflow;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Volo.Abp.Domain.Repositories;
using Volo.Abp.Domain.Services;
using Volo.Abp.Linq;
using Volo.Abp.Uow;
using Volo.Abp.Users;
using WorkflowCore.Models;

namespace Abp.WorkflowCore.Persistence.EntityFrameworkCore;

public class AbpPersistenceProvider : DomainService, IAbpPersistenceProvider
{
    protected readonly IRepository<PersistedEvent, Guid> EventRepository;
    protected readonly IRepository<PersistedExecutionPointer, string> ExecutionPointerRepository;
    protected readonly IRepository<PersistedWorkflow, Guid> WorkflowRepository;
    protected readonly IRepository<PersistedWorkflowDefinition, string> WorkflowDefinitionRepository;
    protected readonly IRepository<PersistedSubscription, Guid> EventSubscriptionRepository;
    protected readonly IRepository<PersistedExecutionError, Guid> ExecutionErrorRepository;
    protected readonly IAsyncQueryableExecuter AsyncQueryableExecuter;
    protected IUnitOfWorkManager UnitOfWorkManager => LazyServiceProvider.LazyGetRequiredService<IUnitOfWorkManager>();
    protected IUnitOfWork? CurrentUnitOfWork => UnitOfWorkManager.Current;

    public AbpPersistenceProvider(IRepository<PersistedEvent, Guid> eventRepository,
        IRepository<PersistedExecutionPointer, string> executionPointerRepository,
        IRepository<PersistedWorkflow, Guid> workflowRepository,
        IRepository<PersistedSubscription, Guid> eventSubscriptionRepository,
        IAsyncQueryableExecuter asyncQueryableExecuter,
        IRepository<PersistedExecutionError, Guid> executionErrorRepository,
        IRepository<PersistedWorkflowDefinition, string> workflowDefinitionRepository)
    {
        EventRepository = eventRepository;
        ExecutionPointerRepository = executionPointerRepository;
        WorkflowRepository = workflowRepository;
        EventSubscriptionRepository = eventSubscriptionRepository;
        AsyncQueryableExecuter = asyncQueryableExecuter;
        ExecutionErrorRepository = executionErrorRepository;
        WorkflowDefinitionRepository = workflowDefinitionRepository;
    }

    [UnitOfWork]
    public virtual async Task<string> CreateNewWorkflow(WorkflowInstance workflow)
    {
        workflow.Id = GuidGenerator.Create().ToString();
        var persistable = workflow.ToPersistable();
        var currentUser = LazyServiceProvider.GetRequiredService<ICurrentUser>();
        persistable.CreateUserIdentityName = currentUser.UserName ?? string.Empty;
        await WorkflowRepository.InsertAsync(persistable, true);
        return workflow.Id;
    }

    [UnitOfWork]
    public virtual async Task PersistWorkflow(WorkflowInstance workflow)
    {
        var uid = new Guid(workflow.Id);
        var query = await WorkflowRepository
            .GetQueryableAsync();
        var existingEntity = await query
            .Where(x => x.Id == uid)
            .Include(wf => wf.ExecutionPointers)
            .ThenInclude(ep => ep.ExtensionAttributes)
            .Include(wf => wf.ExecutionPointers)
            .AsTracking()
            .FirstOrDefaultAsync();
        var isInsert = existingEntity == null;
        var persistedWorkflow = workflow.ToPersistable(existingEntity);
        if (isInsert)
        {
            await WorkflowRepository.InsertAsync(persistedWorkflow, true);
        }
        await CurrentUnitOfWork?.SaveChangesAsync()!;
    }

    [UnitOfWork]
    public virtual async Task PersistWorkflow(WorkflowInstance workflow, List<EventSubscription> subscriptions)
    {
        var uid = new Guid(workflow.Id);
        var query = await WorkflowRepository
            .GetQueryableAsync();
        var existingEntity = await query
            .Where(x => x.Id == uid)
            .Include(wf => wf.ExecutionPointers)
            .ThenInclude(ep => ep.ExtensionAttributes)
            .Include(wf => wf.ExecutionPointers)
            .AsTracking()
            .FirstAsync();
        var persistedWorkflow = workflow.ToPersistable(existingEntity);
        await WorkflowRepository.InsertAsync(persistedWorkflow, true);
        foreach (var subscription in subscriptions)
        {
            subscription.Id = GuidGenerator.Create().ToString();
            var persistable = subscription.ToPersistable();
            await EventSubscriptionRepository.InsertAsync(persistable);
        }
        await CurrentUnitOfWork?.SaveChangesAsync()!;
    }

    [UnitOfWork]
    public virtual async Task<IEnumerable<string>> GetRunnableInstances(DateTime asAt)
    {
        var now = asAt.ToUniversalTime().Ticks;
        var query = (await WorkflowRepository
                .GetQueryableAsync()).Where(x => x.NextExecution.HasValue && x.NextExecution <= now && x.Status == WorkflowStatus.Runnable)
            .Select(x => x.Id);
        var raw = await AsyncQueryableExecuter.ToListAsync(query);
        return raw.Select(s => s.ToString()).ToList();
    }

    [UnitOfWork]
    public virtual async Task<IEnumerable<WorkflowInstance>> GetWorkflowInstances(WorkflowStatus? status, string type, DateTime? createdFrom, DateTime? createdTo, int skip,
        int take)
    {
        var query = (await WorkflowRepository
                .GetQueryableAsync())
            .Include(wf => wf.ExecutionPointers)
            .ThenInclude(ep => ep.ExtensionAttributes)
            .Include(wf => wf.ExecutionPointers)
            .AsQueryable();

        if (status.HasValue)
        {
            query = query.Where(x => x.Status == status.Value);
        }

        if (!string.IsNullOrEmpty(type))
        {
            query = query.Where(x => x.WorkflowDefinitionId == type);
        }

        if (createdFrom.HasValue)
        {
            query = query.Where(x => x.CreateTime >= createdFrom.Value);
        }

        if (createdTo.HasValue)
        {
            query = query.Where(x => x.CreateTime <= createdTo.Value);
        }
        var rawResult = await query.Skip(skip).Take(take).ToListAsync();
        var result = new List<WorkflowInstance>();
        foreach (var item in rawResult)
        {
            result.Add(item.ToWorkflowInstance());
        }
        return result;
    }

    [UnitOfWork]
    public virtual async Task<WorkflowInstance> GetWorkflowInstance(string id)
    {
        var uid = new Guid(id);
        var raw = await (await WorkflowRepository
                .GetQueryableAsync())
            .Include(wf => wf.ExecutionPointers)
            .ThenInclude(ep => ep.ExtensionAttributes)
            .Include(wf => wf.ExecutionPointers)
            .FirstAsync(x => x.Id == uid);
        return raw.ToWorkflowInstance();
    }

    [UnitOfWork]
    public virtual async Task<IEnumerable<WorkflowInstance>> GetWorkflowInstances(IEnumerable<string> ids)
    {
        var uids = ids.Select(i => new Guid(i));
        var raw = (await WorkflowRepository
                .GetQueryableAsync())
            .Include(wf => wf.ExecutionPointers)
            .ThenInclude(ep => ep.ExtensionAttributes)
            .Include(wf => wf.ExecutionPointers)
            .Where(x => uids.Contains(x.Id));

        return (await raw.ToListAsync()).Select(i => i.ToWorkflowInstance());
    }

    [UnitOfWork]
    public virtual async Task<string> CreateEventSubscription(EventSubscription subscription)
    {
        subscription.Id = GuidGenerator.Create().ToString();
        var persistable = subscription.ToPersistable();
        await EventSubscriptionRepository.InsertAsync(persistable);
        return subscription.Id;
    }

    [UnitOfWork]
    public virtual async Task<IEnumerable<EventSubscription?>> GetSubscriptions(string eventName, string eventKey, DateTime asOf)
    {
        asOf = asOf.ToUniversalTime();
        var raw = await (await EventSubscriptionRepository.GetQueryableAsync())
            .Where(x => x.EventName == eventName && x.EventKey == eventKey && x.SubscribeAsOf <= asOf)
            .ToListAsync();

        return raw.Select(item => item.ToEventSubscription()).ToList();
    }

    [UnitOfWork]
    public virtual async Task TerminateSubscription(string eventSubscriptionId)
    {
        var uid = new Guid(eventSubscriptionId);
        var existing = await EventSubscriptionRepository.FirstOrDefaultAsync(x => x.Id == uid);
        if (existing != null)
        {
            await EventSubscriptionRepository.DeleteAsync(existing);
        }
        await CurrentUnitOfWork?.SaveChangesAsync()!;
    }

    [UnitOfWork]
    public virtual async Task<EventSubscription?> GetSubscription(string eventSubscriptionId)
    {
        var uid = new Guid(eventSubscriptionId);
        var raw = await EventSubscriptionRepository.FirstOrDefaultAsync(x => x.Id == uid);
        return raw?.ToEventSubscription();
    }

    [UnitOfWork]
    public virtual async Task<EventSubscription?> GetFirstOpenSubscription(string eventName, string eventKey, DateTime asOf)
    {
        var raw = await EventSubscriptionRepository.FirstOrDefaultAsync(x => x.EventName == eventName && x.EventKey == eventKey && x.SubscribeAsOf <= asOf && x.ExternalToken == null);
        return raw?.ToEventSubscription();
    }

    [UnitOfWork]
    public virtual async Task<bool> SetSubscriptionToken(string eventSubscriptionId, string token, string workerId, DateTime expiry)
    {
        var uid = new Guid(eventSubscriptionId);
        var existingEntity = await (await EventSubscriptionRepository.GetQueryableAsync())
            .Where(x => x.Id == uid)
            .AsTracking()
            .FirstAsync();
        existingEntity.ExternalToken = token;
        existingEntity.ExternalWorkerId = workerId;
        existingEntity.ExternalTokenExpiry = expiry;
        await CurrentUnitOfWork?.SaveChangesAsync()!;
        return true;
    }

    [UnitOfWork]
    public virtual async Task ClearSubscriptionToken(string eventSubscriptionId, string token)
    {
        var uid = new Guid(eventSubscriptionId);
        var existingEntity = await (await EventSubscriptionRepository.GetQueryableAsync())
            .Where(x => x.Id == uid)
            .AsTracking()
            .FirstAsync();

        if (existingEntity.ExternalToken != token)
        {
            throw new InvalidOperationException();
        }

        existingEntity.ExternalToken = null;
        existingEntity.ExternalWorkerId = null;
        existingEntity.ExternalTokenExpiry = null;
        await CurrentUnitOfWork?.SaveChangesAsync()!;
    }

    [UnitOfWork]
    public virtual async Task<string> CreateEvent(Event newEvent)
    {
        newEvent.Id = GuidGenerator.Create().ToString();
        var persistable = newEvent.ToPersistable();
        await EventRepository.InsertAsync(persistable);
        await CurrentUnitOfWork?.SaveChangesAsync()!;
        return newEvent.Id;
    }

    [UnitOfWork]
    public virtual async Task<Event> GetEvent(string id)
    {
        var uid = new Guid(id);
        var raw = await EventRepository
            .FirstAsync(x => x.Id == uid);
        return raw.ToEvent();
    }

    [UnitOfWork]
    public virtual async Task<IEnumerable<string>> GetRunnableEvents(DateTime asAt)
    {
        var now = asAt.ToUniversalTime();
        var raw = await (await EventRepository.GetQueryableAsync())
            .Where(x => !x.IsProcessed)
            .Where(x => x.EventTime <= now)
            .Select(x => x.Id)
            .ToListAsync();

        return raw.Select(s => s.ToString()).ToList();
    }

    [UnitOfWork]
    public virtual async Task<IEnumerable<string>> GetEvents(string eventName, string eventKey, DateTime asOf)
    {
        var raw = await (await EventRepository.GetQueryableAsync())
            .Where(x => x.EventName == eventName && x.EventKey == eventKey)
            .Where(x => x.EventTime >= asOf)
            .Select(x => x.Id)
            .ToListAsync();

        var result = new List<string>();

        foreach (var s in raw)
        {
            result.Add(s.ToString());
        }

        return result;
    }

    [UnitOfWork]
    public virtual async Task MarkEventProcessed(string id)
    {
        var uid = new Guid(id);
        var existingEntity = await (await EventRepository.GetQueryableAsync())
            .Where(x => x.Id == uid)
            .AsTracking()
            .FirstAsync();

        existingEntity.IsProcessed = true;
        await CurrentUnitOfWork?.SaveChangesAsync()!;
    }

    [UnitOfWork]
    public virtual async Task MarkEventUnprocessed(string id)
    {
        var uid = new Guid(id);
        var existingEntity = await (await EventRepository.GetQueryableAsync())
            .Where(x => x.Id == uid)
            .AsTracking()
            .FirstAsync();

        existingEntity.IsProcessed = false;
        await CurrentUnitOfWork?.SaveChangesAsync()!;
    }

    //public virtual Task ScheduleCommand(ScheduledCommand command)
    //{
    //    throw new NotImplementedException();
    //}

    //public virtual Task ProcessCommands(DateTimeOffset asOf, Func<ScheduledCommand, Task> action)
    //{
    //    throw new NotImplementedException();
    //}

    public bool SupportsScheduledCommands => false;

    [UnitOfWork]
    public virtual async Task PersistErrors(IEnumerable<ExecutionError> errors)
    {
        var executionErrors = errors as ExecutionError[] ?? errors.ToArray();
        if (executionErrors.Any())
        {
            foreach (var error in executionErrors)
            {
                await ExecutionErrorRepository.InsertAsync(error.ToPersistable());
            }
            await CurrentUnitOfWork?.SaveChangesAsync()!;
        }
    }

    [UnitOfWork]
    public virtual void EnsureStoreExists()
    {
    }

    public virtual Task<PersistedWorkflow> GetPersistedWorkflowAsync(Guid id)
    {
        return WorkflowRepository.GetAsync(id);
    }

    public virtual async Task<IEnumerable<PersistedWorkflow>> GetAllRunnablePersistedWorkflowAsync(string definitionId, int version)
    {
        return await (await WorkflowRepository.GetQueryableAsync()).Where(u => u.WorkflowDefinitionId == definitionId && u.Version == version).ToListAsync();
    }

    public virtual Task<PersistedExecutionPointer> GetPersistedExecutionPointerAsync(string id)
    {
        return ExecutionPointerRepository.GetAsync(id);
    }

    public virtual async Task<PersistedWorkflowDefinition> GetPersistedWorkflowDefinitionAsync(string id, int version)
    {
        return await (await WorkflowDefinitionRepository.GetQueryableAsync())
            .AsNoTracking().FirstAsync(u => u.Id == id && u.Version == version);
    }
}