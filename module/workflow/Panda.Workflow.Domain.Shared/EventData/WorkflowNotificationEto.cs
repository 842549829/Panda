namespace Panda.Workflow.Domain.Shared.EventData;

public class WorkflowNotificationEto
{
    public Guid WorkId { get; set; }

    public Guid? TenantId { get; set; }

    public List<Guid> UserIds { get; set; }

    public string Content { get; set; } = default!;
}