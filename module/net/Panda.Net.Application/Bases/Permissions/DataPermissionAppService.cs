using Panda.DataPermission.Abstractions.DataPermission;
using Panda.Net.Bases.Permissions.Dtos;

namespace Panda.Net.Bases.Permissions;

public class DataPermissionAppService(IDataPermissionManager dataPermissionManager) : NetAppService, IDataPermissionAppService
{
    public async Task<DataPermissionDto> GetDataPermissionsAsync(string[] roles)
    {
        var (dataPermission, customDataPermission) = await dataPermissionManager.GetDataPermissionsAsync(roles);
        return new DataPermissionDto
        {
            DataPermission = dataPermission,
            CustomDataPermission = customDataPermission
        };
    }
}