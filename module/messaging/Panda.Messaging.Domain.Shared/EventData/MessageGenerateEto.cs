using System.ComponentModel.DataAnnotations;
using Panda.Messaging.Domain.Shared.Constants;
using Panda.Messaging.Domain.Shared.Enums;
using Panda.Messaging.Domain.Shared.Models;
using Volo.Abp.Data;

namespace Panda.Messaging.Domain.Shared.EventData;

/// <summary>
/// 创建消息Eto
/// </summary>
public class MessageGenerateEto : IHasExtraProperties, IValidatableObject
{
    /// <summary>
    /// 消息Id
    /// </summary>
    public Guid? MessageId { get; set; }

    /// <summary>
    /// 所属系统名称（消息发起系统）
    /// </summary>
    [Required(AllowEmptyStrings = false)]
    [StringLength(MessageConstants.MaxApplicationNameLength)]
    public string ApplicationName { get; set; }

    /// <summary>
    /// 消息类型 
    /// </summary>
    [Required]
    [Range(1, int.MaxValue)]
    public MessageType MessageType { get; set; }

    /// <summary>
    /// 消息推送方式
    /// </summary>
    [Required]
    public PushProviderCode PushProviderCode { get; set; }

    /// <summary>
    /// 消息标题
    /// </summary>
    [Required(AllowEmptyStrings = false)]
    [StringLength(MessageConstants.MaxTitleLength)]
    public string Title { get; set; }

    /// <summary>
    /// 消息内容
    /// </summary>
    [Required(AllowEmptyStrings = false)]
    [StringLength(MessageConstants.MaxContentLength)]
    public string Content { get; set; }

    /// <summary>
    /// 标签 二进制编码，用于扩展
    /// </summary>
    public long? Tag { get; set; }

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
    /// 发送人Id
    /// </summary>
    [Required(AllowEmptyStrings = false)]
    public Guid SendUserId { get; set; }

    /// <summary>
    /// 发送人姓名
    /// </summary>
    [Required(AllowEmptyStrings = false)]
    [StringLength(MessageConstants.MaxSendUserNameLength)]
    public string SendUserName { get; set; }

    /// <summary>
    /// 到期时间（到期后收件人不可查看）
    /// </summary>
    public DateTime? ExpirationTime { get; set; }

    /// <summary>
    /// 通知范围 key：providerName，value：providerKey
    /// </summary>
    [Required]
    public MessageScopeModel[] Scopes { get; set; }

    /// <summary>
    /// 扩展属性
    /// </summary>
    public ExtraPropertyDictionary? ExtraProperties { get; set; }

    /// <summary>确定指定的对象是否有效</summary>
    /// <param name="validationContext">验证上下文</param>
    /// <returns>保存验证失败信息的集合</returns>
    public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
    {
        if (ExpirationTime.HasValue && ExpirationTime.Value <= DateTime.Now)
        {
            yield return new ValidationResult("到期时间应在当前时间后!",
                new[] { nameof(ExpirationTime) });
        }

        if (DelayedSend)
        {
            if (!SendTime.HasValue)
            {
                yield return new ValidationResult("发送时间用于延迟发送消息不可为空!",
                    new[] { nameof(SendTime) });
            }

            if (SendTime.HasValue && SendTime.Value < DateTime.Now.AddMinutes(2))
            {
                yield return new ValidationResult("发送时间应该在当前时间的两分钟之后!",
                    new[] { nameof(SendTime) });
            }
        }
    }
}