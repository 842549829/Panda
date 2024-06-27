namespace Panda.DataPermission.Abstractions.DataPermission;

public interface IDataPermissionManager
{
    Task<(DataPermission, string)> GetDataPermissionsAsync(string[] roles);
}