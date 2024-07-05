using Panda.DataPermission.Abstractions.DataPermission;
using Volo.Abp.Domain.Services;

namespace Panda.DataDictionary.Domain.Permissions.Managers;

public class DataPermissionManager(IDataPermissionService dataPermissionService) : DomainService, IDataPermissionManager
{
    public Task<(DataPermission.Abstractions.DataPermission.DataPermission, string)> GetDataPermissionsAsync(string[] roles)
    {
        return dataPermissionService.GetDataPermissionsAsync(roles);
    }
}