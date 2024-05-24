using System.ComponentModel.DataAnnotations;
using Volo.Abp.Application.Dtos;

namespace Panda.Messaging.Application.Contracts;

/// <summary>
/// 数据模型：消息新增/修改
/// </summary>
public class MessageCreateOrUpdateDtoBase : ExtensibleEntityDto
{
    /// <summary>
    /// 消息标题
    /// </summary>
    [Required(AllowEmptyStrings = false)]
    public virtual string Title { get; set; }

    /// <summary>
    /// 消息内容
    /// </summary>
    [Required(AllowEmptyStrings = false)]
    public virtual string Content { get; set; }

    /// <summary>
    /// 标签 二进制编码，用于扩展
    /// </summary>
    public virtual string[] Tag { get; set; }

    /// <summary>
    /// 到期时间（到期后收件人不可查看）
    /// </summary>
    public DateTime? ExpirationTime { get; set; }

    public override IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
    {
        foreach (var validationResult in base.Validate(validationContext))
        {
            yield return validationResult;
        }

        if (ExpirationTime.HasValue && ExpirationTime.Value <= DateTime.Now)
        {
            yield return new ValidationResult("ExpirationTime should after current time!",
                new[] {nameof(ExpirationTime)});
        }
    }
}