namespace Panda.DataPermission.Abstractions.DataPermission;

/// <summary>
/// 数据权限参与者
/// </summary>
public interface IDataPermissionResolveContributor
{
    /// <summary>
    /// 参与者名称
    /// </summary>
    public string Name { get; }

    /// <summary>
    /// 解析数据权限方法
    /// </summary>
    /// <param name="context">数据权限当前上下文接口</param>
    /// <returns>异步</returns>
    Task ResolveAsync(IDataPermissionResolveContext context);
}