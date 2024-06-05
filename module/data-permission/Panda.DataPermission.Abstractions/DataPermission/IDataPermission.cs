namespace Panda.DataPermission.Abstractions.DataPermission;

/// <summary>
/// 数据权限接口
/// </summary>
public interface IDataPermission
{
    /// <summary>
    /// Hierarchical Code of this organization unit.
    /// Example: "00001.00042.00005".
    /// This is a unique code for an OrganizationUnit.
    /// It's changeable if OU hierarchy is changed.
    /// </summary>
    public string Code { get; set; }
}