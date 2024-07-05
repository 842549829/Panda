using Panda.Net.Bases.Permissions.Dtos;
using Volo.Abp.Application.Services;

namespace Panda.Net.Bases.Permissions;

public interface IPermissionAppService : IApplicationService
{
    Task<List<PermissionTreeDto>> GetAllPermissionsAsync();

    Task<List<PermissionTreeDto>> GetCurrentPermissionsAsync();

    Task<List<PermissionGroupDefinitionDto>> GetPermissionGroupDefinitionListAsync();

    Task<List<PermissionDefinitionDto>> GetPermissionDefinitionListAsync(string groupName);
}