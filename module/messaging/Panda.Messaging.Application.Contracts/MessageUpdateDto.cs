using System.ComponentModel.DataAnnotations;

namespace Panda.Messaging.Application.Contracts;

/// <summary>
/// 数据模型：消息修改
/// </summary>
public class MessageUpdateDto : MessageCreateOrUpdateDtoBase
{
    /// <summary>
    /// 并发Stamp
    /// </summary>
    [Required]
    public string ConcurrencyStamp { get; set; }
}