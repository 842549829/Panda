using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Panda.Net.Bases.Roles.Dtos;
using Panda.Net.Bases.Users.Dtos;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Identity;

namespace Panda.Net.Bases.Users;

public interface IUserAppService : IApplicationService
{
    Task<bool> TestAsync(CreateInputDto input);

    Task<IdentityUserDto> CreateAsync(UserCreateDto input);

    Task<IdentityUserDto> UpdateAsync(Guid id, UserUpdateDto input);

    Task<IdentityUserDto> GetAsync(Guid id);

    Task<PagedResultDto<IdentityUserDto>> GetListAsync(GetIdentityUsersInput input);

    Task DeleteAsync(Guid id);

    Task<ListResultDto<IdentityRoleDto>> GetRolesAsync(Guid id);

    Task<ListResultDto<IdentityRoleDto>> GetAssignableRolesAsync();

    Task UpdateRolesAsync(Guid id, IdentityUserUpdateRolesDto input);

    Task<IdentityUserDto?> FindByUsernameAsync(string userName);

    Task<IdentityUserDto?> FindByEmailAsync(string email);
    
    Task<IdentityUserDetailDto> GetAsyncDetail(Guid id);

    Task UpdateAvatarAsync(Guid id, UserAvatarUpdateDto input);

    Task<IEnumerable<SearchUserOutputDto>> GetUsersAsync(SearchUserListInputDto input);

    Task<IEnumerable<RoleDto>> GetRoleAsync();
}