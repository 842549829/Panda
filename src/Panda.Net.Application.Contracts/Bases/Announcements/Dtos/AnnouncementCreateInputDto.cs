using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Panda.Net.Bases.Announcements.Dtos;

/// <summary>
/// 数据模型 公告管理新增实体
/// </summary>
public class AnnouncementCreateInputDto : IValidatableObject
{
    /// <summary>
    /// 公告标题
    /// </summary>
    [Required(AllowEmptyStrings = false)]
    [MaxLength(100)]
    public string Title { get; set; }

    /// <summary>
    /// 发布时间
    /// </summary>
    public DateTime? PublishTime { get; set; }

    /// <summary>
    /// 发布类型{0:立即发送,1:指定时间发送}
    /// </summary>
    public int PublishType { get; set; }

    /// <summary>
    /// 创建人名称
    /// </summary>
    public string? CreatorName { get; set; }

    /// <summary>
    /// 公告内容
    /// </summary>
    [Required]
    public string Content { get; set; }

    /// <summary>Determines whether the specified object is valid.</summary>
    /// <param name="validationContext">The validation context.</param>
    /// <returns>A collection that holds failed-validation information.</returns>
    public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
    {
        if (PublishType == 1 && !PublishTime.HasValue)
        {
            yield return new ValidationResult("指定发送时间不能为空！", new[] {nameof(PublishTime)});
        }

        if (PublishType == 1 && PublishTime.HasValue && PublishTime.Value < DateTime.Now.AddMinutes(2))
        {
            yield return new ValidationResult("指定发送时间必须在当前时间两分钟之后！", new[] {nameof(PublishTime)});
        }
    }
}