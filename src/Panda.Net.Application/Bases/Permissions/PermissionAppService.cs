using Panda.Net.Bases.Permissions.Dtos;
using Panda.Net.Bases.Permissions.Managers;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.PermissionManagement;

namespace Panda.Net.Bases.Permissions;

public class PermissionAppService : NetAppService, IPermissionAppService
{
    private readonly INetPermissionManager _netPermissionManager;

    public PermissionAppService(INetPermissionManager netPermissionManager)
    {
        _netPermissionManager = netPermissionManager;
    }

    [RemoteService(IsEnabled = false)]
    public async Task<List<PermissionTreeDto>> GetAllPermissionsAsync()
    {
        var permissionTree = await _netPermissionManager.GetAllPermissionTreeListAsync();
        return ObjectMapper.Map<List<PermissionTree>, List<PermissionTreeDto>>(permissionTree);
    }

    [RemoteService(IsEnabled = false)]
    public async Task<List<PermissionTreeDto>> GetCurrentPermissionsAsync()
    {
        var permissionTree = await _netPermissionManager.GetPermissionTreeListAsync(CurrentUser.Id.GetValueOrDefault());
        return ObjectMapper.Map<List<PermissionTree>, List<PermissionTreeDto>>(permissionTree);
    }

    [RemoteService(IsEnabled = false)]
    public async Task<List<PermissionGroupDefinitionDto>> GetPermissionGroupDefinitionListAsync()
    {
        var permissionGroupDefinitionRecords = await _netPermissionManager.GetPermissionGroupDefinitionListAsync();
        var permissionGroupDefinitionList = ObjectMapper.Map<List<PermissionGroupDefinitionRecord>, List<PermissionGroupDefinitionDto>>(permissionGroupDefinitionRecords);
        return permissionGroupDefinitionList;
    }

    [RemoteService(IsEnabled = false)]
    public async Task<List<PermissionDefinitionDto>> GetPermissionDefinitionListAsync(string groupName)
    {
        var permissionDefinitionRecords = await _netPermissionManager.GetPermissionDefinitionListAsync(groupName);
        var permissionDefinitionList = ObjectMapper.Map<List<PermissionDefinitionRecord>, List<PermissionDefinitionDto>>(permissionDefinitionRecords);
        return permissionDefinitionList;
    }
}