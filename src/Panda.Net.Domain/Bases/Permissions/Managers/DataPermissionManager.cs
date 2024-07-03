using Panda.DataPermission.Abstractions.DataPermission;
using Panda.Net.Bases.Roles.Repositories;
using System;
using System.Linq;
using System.Threading.Tasks;
using Volo.Abp.Data;

namespace Panda.Net.Bases.Permissions.Managers;

public class DataPermissionManager(IRoleExtensionRepository roleExtensionRepository) : NetDomainService,
    IDataPermissionManager
{
    public async Task<(DataPermission.Abstractions.DataPermission.DataPermission, string)> GetDataPermissionsAsync(string[] roles)
    {
        var roleExtensions = await roleExtensionRepository.GetRoleAsync(roles);
        if (roleExtensions.Any(d => d.GetProperty<DataPermission.Abstractions.DataPermission.DataPermission>("DataPermission") == DataPermission.Abstractions.DataPermission.DataPermission.All))
        {
            return (DataPermission.Abstractions.DataPermission.DataPermission.All, string.Empty);
        }
        if (roleExtensions.Any(d => d.GetProperty<DataPermission.Abstractions.DataPermission.DataPermission>("DataPermission") == DataPermission.Abstractions.DataPermission.DataPermission.CurAndSub))
        {
            return (DataPermission.Abstractions.DataPermission.DataPermission.CurAndSub, string.Empty);
        }
        if (roleExtensions.Any(d => d.GetProperty<DataPermission.Abstractions.DataPermission.DataPermission>("DataPermission") == DataPermission.Abstractions.DataPermission.DataPermission.Cur))
        {
            return (DataPermission.Abstractions.DataPermission.DataPermission.Cur, string.Empty);
        }
        if (roleExtensions.Any(d => d.GetProperty<DataPermission.Abstractions.DataPermission.DataPermission>("DataPermission") == DataPermission.Abstractions.DataPermission.DataPermission.Sub))
        {
            return (DataPermission.Abstractions.DataPermission.DataPermission.Sub, string.Empty);
        }
        var customDataPermission = roleExtensions.FirstOrDefault(d =>
            d.GetProperty<DataPermission.Abstractions.DataPermission.DataPermission>("DataPermission") ==
            DataPermission.Abstractions.DataPermission.DataPermission.Custom);
        return (DataPermission.Abstractions.DataPermission.DataPermission.Custom, customDataPermission?.GetProperty<string>("CustomDataPermission") ?? string.Empty);
    }
}