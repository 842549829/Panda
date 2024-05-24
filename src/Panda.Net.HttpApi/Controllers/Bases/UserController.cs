using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Panda.Net.Bases.Users;
using Panda.Net.Bases.Users.Dtos;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Panda.Net.Bases.Roles.Dtos;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Identity;

namespace Panda.Net.Controllers.Bases;

[Route("api/basics/users")]
[ApiController]
public class UserController : NetController
{
    private readonly IUserAppService _userAppService;

    public UserController(IUserAppService userAppService)
    {
        _userAppService = userAppService;
    }

    [NonAction]
    [HttpGet("test")]
    public Task<IdentityUserDto> GetAsync()
    {
        return Task.FromResult(new IdentityUserDto { Name = "张三", Email = "8756455@qq.com" });
    }

    [NonAction]
    [HttpPost("test")]
    public Task<bool> TestAsync(CreateInputDto input)
    {
        return _userAppService.TestAsync(input);
    }

    [HttpPost]
    public Task<IdentityUserDto> CreateAsync([FromBody] UserCreateDto input)
    {
        return _userAppService.CreateAsync(input);
    }

    [HttpPut("{id:guid}")]
    public Task<IdentityUserDto> UpdateAsync(Guid id, UserUpdateDto input)
    {
        return _userAppService.UpdateAsync(id, input);
    }

    [HttpGet]
    [Route("{id:guid}")]
    [Authorize]
    public Task<IdentityUserDto> GetAsync(Guid id)
    {
        return _userAppService.GetAsync(id);
    }

    [HttpGet]
    [Route("{id:guid}/detail")]
    [Authorize]
    public Task<IdentityUserDetailDto> GetAsyncDetail(Guid id)
    {
        return _userAppService.GetAsyncDetail(id);
    }

    [HttpGet]
    public Task<PagedResultDto<IdentityUserDto>> GetListAsync([FromQuery] GetIdentityUsersInput input)
    {
        return _userAppService.GetListAsync(input);
    }

    [HttpDelete]
    [Route("{id:guid}")]
    public Task DeleteAsync(Guid id)
    {
        return _userAppService.DeleteAsync(id);
    }

    [HttpGet]
    [Route("{id:guid}/roles")]
    public Task<ListResultDto<IdentityRoleDto>> GetRolesAsync(Guid id)
    {
        return _userAppService.GetRolesAsync(id);
    }

    [HttpGet]
    [Route("assignable-roles")]
    public Task<ListResultDto<IdentityRoleDto>> GetAssignableRolesAsync()
    {
        return _userAppService.GetAssignableRolesAsync();
    }

    [HttpPut]
    [Route("{id:guid}/roles")]
    public Task UpdateRolesAsync(Guid id, IdentityUserUpdateRolesDto input)
    {
        return _userAppService.UpdateRolesAsync(id, input);
    }

    [HttpGet]
    [Route("by-username/{userName}")]
    public Task<IdentityUserDto?> FindByUsernameAsync(string userName)
    {
        return _userAppService.FindByUsernameAsync(userName);
    }

    [HttpGet]
    [Route("by-email/{email}")]
    public Task<IdentityUserDto?> FindByEmailAsync(string email)
    {
        return _userAppService.FindByEmailAsync(email);
    }

    [HttpPut]
    [Route("{id:guid}/avatar")]
    public Task UpdateAvatarAsync(Guid id, [FromBody] UserAvatarUpdateDto input)
    {
        return _userAppService.UpdateAvatarAsync(id, input);
    }

    [HttpGet("user-select")]
    public Task<IEnumerable<SearchUserOutputDto>> GetUsersAsync([FromQuery] SearchUserListInputDto input)
    {
        return _userAppService.GetUsersAsync(input);
    }

    [HttpGet("role-select")]
    public Task<IEnumerable<RoleDto>> GetRoleAsync()
    {
        return _userAppService.GetRoleAsync();
    }
}