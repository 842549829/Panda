namespace Panda.DataPermission.Abstractions.DataPermission;

public class DataPermissionResolveContext : IDataPermissionResolveContext
{
    public IServiceProvider ServiceProvider { get; }

    /// <summary>
    /// 数据权限
    /// </summary>
    public DataPermission? DataPermission { get; set; }

    /// <summary>
    /// 数据权限
    /// </summary>
    public string? DataPermissionCode { get; set; }

    /// <summary>
    /// 是否已解析
    /// </summary>
    public bool Handled { get; set; }

    public DataPermissionResolveContext(IServiceProvider serviceProvider)
    {
        ServiceProvider = serviceProvider;
    }

    public bool HasResolvedTenantOrHost()
    {
        return Handled || (DataPermission != null && DataPermissionCode != null);
    }
}