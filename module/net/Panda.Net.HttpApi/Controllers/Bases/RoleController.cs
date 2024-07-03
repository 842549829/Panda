using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using System;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Identity;
using Panda.Net.Bases.Roles;
using Panda.Net.Bases.Roles.Dtos;
using System.Collections.Generic;
using System.Threading;
using Microsoft.AspNetCore.Authorization;

namespace Panda.Net.Controllers.Bases;

[Route("api/basics/roles")]
[ApiController]
public class RoleController : NetController
{
    private readonly IRoleAppService _roleAppService;

    public RoleController(IRoleAppService roleAppService)
    {
        _roleAppService = roleAppService;
    }

    [HttpGet]
    public Task<PagedResultDto<IdentityRoleDto>> GetListAsync([FromQuery] GetIdentityRolesInput input)
    {
        return _roleAppService.GetListAsync(input);
    }

    [HttpGet]
    [Route("{id:guid}")]
    public Task<RoleDto> GetAsync(Guid id)
    {
        return _roleAppService.GetAsync(id);
    }

    [HttpGet("permissions/{id:guid}")]
    public Task<List<string>> GetPermissionListAsync(Guid id, CancellationToken cancellationToken = default)
    {
        return _roleAppService.GetPermissionListAsync(id, cancellationToken);
    }

    [HttpGet("all")]
    [Authorize]
    public Task<List<string>> GetAllAsync()
    {
        return _roleAppService.GetAllAsync();
    }

    [HttpPost]
    public Task<IdentityRoleDto> CreateAsync(RoleCreateDto input)
    {
        return _roleAppService.CreateAsync(input);
    }

    [HttpPut]
    [Route("{id:guid}")]
    public Task<IdentityRoleDto> UpdateAsync(Guid id, RoleUpdateDto input)
    {
        return _roleAppService.UpdateAsync(id, input);
    }

    [HttpDelete]
    [Route("{id:guid}")]
    public Task DeleteAsync(Guid id)
    {
        return _roleAppService.DeleteAsync(id);
    }
}