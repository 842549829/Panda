using Panda.Messaging.Domain.Shared.Constants;
using System.ComponentModel.DataAnnotations;
using Volo.Abp.Application.Dtos;

namespace Panda.Messaging.Application.Contracts;

/// <summary>
/// 数据模型：消息通知范围
/// </summary>
public class MessageScopeDto : EntityDto, IValidatableObject
{
    /// <summary>
    /// 关联提供商类型（S：全局系统消息，A：系统，O：机构/部门，R：角色，G：群组，U：用户）
    /// </summary>
    [Required]
    public string ProviderName { get; set; }

    /// <summary>
    /// 关联提供商类型名称（S：Null，A：Number，O：Number，D：Number，R：RoleName，G：Number，U：UserName）
    /// </summary>
    public string ProviderKey { get; set; }

    /// <summary>Determines whether the specified object is valid.</summary>
    /// <param name="validationContext">The validation context.</param>
    /// <returns>A collection that holds failed-validation information.</returns>
    public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
    {
        if (ProviderName != MessageScopingConstants.MessageScopingProviderName.System
            && ProviderKey.IsNullOrWhiteSpace())
        {
            yield return new ValidationResult("消息范围标记值不能为空！", new[] {nameof(ProviderKey)});
        }
    }
}