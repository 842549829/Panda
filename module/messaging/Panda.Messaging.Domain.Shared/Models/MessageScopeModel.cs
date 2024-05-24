namespace Panda.Messaging.Domain.Shared.Models;

/// <summary>
/// 消息范围
/// </summary>
public class MessageScopeModel
{
    /// <summary>
    /// 关联提供商类型（S：全局系统消息，A：系统，O：机构/部门，R：角色，G：群组，U：用户）
    /// </summary>
    public string? ProviderName { get; set; }

    /// <summary>
    /// 关联提供商类型名称（S：All，A：Number，O：Number，D：Number，R：RoleName，G：Number，U：UserName）
    /// </summary>
    public string? ProviderKey { get; set; }
}