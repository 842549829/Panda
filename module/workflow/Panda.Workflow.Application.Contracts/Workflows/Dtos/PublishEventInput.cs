namespace Panda.Workflow.Application.Contracts.Workflows.Dtos;

public class PublishEventInput
{
    public string  EventKey { get; set; }

    public string  EventName { get; set; }

    public object EventData { get; set; }
}