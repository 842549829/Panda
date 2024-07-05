using Panda.DataDictionary.Domain.Permissions.Managers;
using Panda.Net.Bases.Permissions;
using Volo.Abp.DependencyInjection;

namespace Panda.DataDictionary.Application.Permissions;

public class DataPermissionService(IDataPermissionAppService dataPermissionAppService) : IDataPermissionService, ITransientDependency
{
    public async Task<(DataPermission.Abstractions.DataPermission.DataPermission, string)> GetDataPermissionsAsync(string[] roles)
    {
        var datPermission = await dataPermissionAppService.GetDataPermissionsAsync(roles);
        return (datPermission.DataPermission, datPermission.CustomDataPermission);
    }
}