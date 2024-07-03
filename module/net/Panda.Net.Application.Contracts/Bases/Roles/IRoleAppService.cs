using Panda.Net.Bases.Roles.Dtos;
using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Identity;

namespace Panda.Net.Bases.Roles;

public interface IRoleAppService : IApplicationService
{
    Task<IdentityRoleDto> CreateAsync(RoleCreateDto input);

    Task<IdentityRoleDto> UpdateAsync(Guid id, RoleUpdateDto input);

    Task DeleteAsync(Guid id);

    Task<PagedResultDto<IdentityRoleDto>> GetListAsync(GetIdentityRolesInput input);

    Task<RoleDto> GetAsync(Guid id);

    Task<List<string>> GetPermissionListAsync(Guid id, CancellationToken cancellationToken = default);
    
    Task<List<string>> GetAllAsync();
}