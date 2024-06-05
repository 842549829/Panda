namespace Panda.DataPermission.Abstractions.DataPermission;

/// <summary>
/// 数据权限解析配置
/// </summary>
public class DataPermissionResolveOptions
{
    public List<IDataPermissionResolveContributor> DataPermissionResolvers { get; }

    public DataPermissionResolveOptions()
    {
        DataPermissionResolvers = new List<IDataPermissionResolveContributor>();
    }
}