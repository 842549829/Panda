using PandaPermission = Panda.DataPermission.Abstractions.DataPermission;

namespace Panda.Net.Bases.Roles.Entities;

/// <summary>
/// 角色扩展
/// </summary>
public class RoleExtension
{
    /// <summary>
    /// 数据权限
    /// </summary>
    public PandaPermission.DataPermission DataPermission { get; set; }

    /// <summary>
    /// 自定义数据权限
    /// </summary>
    public string CustomDataPermission { get; set; } = default!;
}