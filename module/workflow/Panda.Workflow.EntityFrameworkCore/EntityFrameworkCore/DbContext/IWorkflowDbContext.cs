using Abp.Workflow;
using Abp.WorkflowCore.Persistence;
using Microsoft.EntityFrameworkCore;
using Panda.Workflow.Domain.Workflows.Entities;
using Panda.Workflow.EntityFrameworkCore.EntityFrameworkCore.Configs;
using Volo.Abp.Data;
using Volo.Abp.EntityFrameworkCore;

namespace Panda.Workflow.EntityFrameworkCore.EntityFrameworkCore.DbContext;

[ConnectionStringName(WorkflowDbProperties.ConnectionStringName)]
public interface IWorkflowDbContext : IEfCoreDbContext
{
    public DbSet<PersistedEvent> PersistedEvents { get; set; }
    public DbSet<PersistedExecutionError> PersistedExecutionErrors { get; set; }
    public DbSet<PersistedExecutionPointer> PersistedExecutionPointers { get; set; }
    public DbSet<PersistedExtensionAttribute> PersistedExtensionAttributes { get; set; }
    public DbSet<PersistedSubscription> PersistedSubscriptions { get; set; }
    public DbSet<PersistedWorkflow> PersistedWorkflows { get; set; }
    public DbSet<PersistedWorkflowDefinition> PersistedWorkflowDefinitions { get; set; }
    public DbSet<PersistedWorkflowAuditor> PersistedWorkflowAuditors { get; set; }
}