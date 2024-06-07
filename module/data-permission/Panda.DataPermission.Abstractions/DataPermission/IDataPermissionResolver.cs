namespace Panda.DataPermission.Abstractions.DataPermission;

public interface IDataPermissionResolver
{
    Task<DataPermissionResolveResult> ResolveDataPermissionAsync();
}