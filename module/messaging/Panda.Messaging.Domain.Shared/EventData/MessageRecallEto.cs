namespace Panda.Messaging.Domain.Shared.EventData;

public class MessageRecallEto
{
    /// <summary>
    /// 消息Id
    /// </summary>
    public Guid MessageId { get; set; }

    /// <summary>
    /// 撤回人Id
    /// </summary>
    public Guid RecalledUserId { get; set; }

    /// <summary>
    /// 撤回人名称
    /// </summary>
    public string RecalledUserName { get; set; }
}