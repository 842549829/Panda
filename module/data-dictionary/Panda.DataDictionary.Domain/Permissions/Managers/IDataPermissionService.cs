namespace Panda.DataDictionary.Domain.Permissions.Managers;

public interface IDataPermissionService
{
    Task<(DataPermission.Abstractions.DataPermission.DataPermission, string)> GetDataPermissionsAsync(string[] roles);
}