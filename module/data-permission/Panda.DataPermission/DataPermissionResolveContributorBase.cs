using Panda.DataPermission.Abstractions.DataPermission;

namespace Panda.DataPermission;

public abstract class DataPermissionResolveContributorBase : IDataPermissionResolveContributor
{
    /// <summary>
    /// 参与者名称
    /// </summary>
    public abstract string Name { get; }

    /// <summary>
    /// 解析数据权限方法
    /// </summary>
    /// <param name="context">数据权限当前上下文接口</param>
    /// <returns>异步</returns>
    public abstract Task ResolveAsync(IDataPermissionResolveContext context);
}