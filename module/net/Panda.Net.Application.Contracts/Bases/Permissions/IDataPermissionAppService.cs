using Panda.Net.Bases.Permissions.Dtos;
using Volo.Abp.Application.Services;

namespace Panda.Net.Bases.Permissions;

public interface IDataPermissionAppService : IApplicationService
{
    Task<DataPermissionDto> GetDataPermissionsAsync(string[] roles);
}