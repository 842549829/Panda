using Panda.Messaging.Domain.Shared.Enums;
using System.ComponentModel.DataAnnotations;

namespace Panda.Messaging.Application.Contracts;

/// <summary>
/// 数据模型：消息新增
/// </summary>
public class MessageCreateDto : MessageCreateOrUpdateDtoBase
{
    public MessageCreateDto()
    {
        Scopes = new List<MessageScopeDto>();
    }

    /// <summary>
    /// 所属系统名称（消息发起系统）
    /// </summary>
    [Required(AllowEmptyStrings = false)]
    public string ApplicationName { get; set; }

    /// <summary>
    /// 消息类型 1：通知，2：预警，99：其他 ...
    /// </summary>
    [Required]
    [Range(1, int.MaxValue)]
    public MessageType MessageType { get; set; }

    /// <summary>
    /// 消息推送方式 1：系统消息，2：短信消息，4：邮件消息
    /// </summary>
    [Required]
    public PushProviderCode PushProviderCode { get; set; }

    /// <summary>
    /// 是否定时发送（延迟发送）0：否 1：是
    /// </summary>
    [Required]
    public bool DelayedSend { get; set; }

    /// <summary>
    /// 发送时间
    /// </summary>
    public DateTime? SendTime { get; set; }

    /// <summary>
    /// 通知范围 key：providerName，value：providerKey
    /// </summary>
    [Required]
    public List<MessageScopeDto> Scopes { get; set; }

    public override IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
    {
        foreach (var validationResult in base.Validate(validationContext))
        {
            yield return validationResult;
        }

        if (DelayedSend)
        {
            if (!SendTime.HasValue)
            {
                yield return new ValidationResult("SendTime is required for delay send message!",
                    new[] {nameof(SendTime)});
            }

            if (SendTime.HasValue && SendTime.Value < DateTime.Now.AddMinutes(2))
            {
                yield return new ValidationResult("SendTime should after two minutes from current time!",
                    new[] {nameof(SendTime)});
            }
        }

        if (Scopes == null || !Scopes.Any())
        {
            yield return new ValidationResult("Scopes should contain one item at least!",
                new[] {nameof(Scopes)});
        }
    }
}