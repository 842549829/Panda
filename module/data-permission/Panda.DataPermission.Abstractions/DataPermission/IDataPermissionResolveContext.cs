using Volo.Abp.DependencyInjection;

namespace Panda.DataPermission.Abstractions.DataPermission;

/// <summary>
/// 数据权限当前上下文接口
/// </summary>
public interface IDataPermissionResolveContext : IServiceProviderAccessor
{
    /// <summary>
    /// 数据权限
    /// </summary>
    DataPermission? DataPermission { get; set; }

    /// <summary>
    /// 数据权限Code
    /// </summary>
    string? DataPermissionCode { get; set; }

    /// <summary>
    /// 是否已解析
    /// </summary>
    bool Handled { get; set; }
}