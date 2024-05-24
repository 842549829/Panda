using Panda.Messaging.Domain.Entities;

namespace Panda.Messaging.Domain.Modules;

public class ReceivedMessage
{
    public Message Message { get; set; }

    /// <summary>
    /// 已读状态 0：未读，1：已读
    /// </summary>
    public bool IsRead { get; set; }

    /// <summary>
    /// 查阅时间
    /// </summary>
    public DateTime? ReadTime { get; set; }
}