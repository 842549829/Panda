using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Options;
using Panda.Net.Bases.Users.Dtos;
using Panda.Net.Bases.Users.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Panda.Net.Bases.Roles.Dtos;
using Volo.Abp;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Data;
using Volo.Abp.Identity;
using Volo.Abp.ObjectExtending;

namespace Panda.Net.Bases.Users;

public class UserAppService : NetAppService, IUserAppService
{
    private readonly IUserExtensionRepository _extensionRepository;
    private readonly IdentityUserManager _userManager;
    private readonly IIdentityUserRepository _userRepository;
    private readonly IIdentityRoleRepository _roleRepository;
    private readonly IOptions<IdentityOptions> _identityOptions;

    public UserAppService(IUserExtensionRepository extensionRepository,
        IdentityUserManager userManager,
        IIdentityUserRepository userRepository,
        IIdentityRoleRepository roleRepository,
        IOptions<IdentityOptions> identityOptions)
    {
        _extensionRepository = extensionRepository;
        _userManager = userManager;
        _userRepository = userRepository;
        _roleRepository = roleRepository;
        _identityOptions = identityOptions;
    }

    [RemoteService(IsEnabled = false)]
    public async Task<bool> TestAsync(CreateInputDto input)
    {
        var users = await _extensionRepository.GetAllAsync();
        return true;
    }

    [RemoteService(IsEnabled = false)]
    public async Task<IdentityUserDto> CreateAsync(UserCreateDto input)
    {
        await _identityOptions.SetAsync();
        var user = new Volo.Abp.Identity.IdentityUser(
            GuidGenerator.Create(),
            input.UserName,
            input.Email,
            CurrentTenant.Id
        );
        input.MapExtraPropertiesTo(user);
        (await _userManager.CreateAsync(user, input.Password)).CheckErrors();
        await UpdateUserByInput(user, input);
        (await _userManager.UpdateAsync(user)).CheckErrors();
        await _userManager.AddToOrganizationUnitAsync(user.Id, input.OrganizationId);
        await CurrentUnitOfWork?.SaveChangesAsync()!;
        return ObjectMapper.Map<Volo.Abp.Identity.IdentityUser, IdentityUserDto>(user);
    }

    [RemoteService(IsEnabled = false)]
    public virtual async Task<IdentityUserDto> UpdateAsync(Guid id, UserUpdateDto input)
    {
        await _identityOptions.SetAsync();

        var user = await _userManager.GetByIdAsync(id);

        user.SetConcurrencyStampIfNotNull(input.ConcurrencyStamp);

        (await _userManager.SetUserNameAsync(user, input.UserName)).CheckErrors();

        await UpdateUserByInput(user, input);
        input.MapExtraPropertiesTo(user);

        (await _userManager.UpdateAsync(user)).CheckErrors();

        if (!input.Password.IsNullOrEmpty())
        {
            (await _userManager.RemovePasswordAsync(user)).CheckErrors();
            (await _userManager.AddPasswordAsync(user, input.Password)).CheckErrors();
        }

        await _userManager.SetOrganizationUnitsAsync(user.Id, input.OrganizationId);

        await CurrentUnitOfWork?.SaveChangesAsync()!;

        return ObjectMapper.Map<Volo.Abp.Identity.IdentityUser, IdentityUserDto>(user);
    }

    [RemoteService(IsEnabled = false)]
    public async Task<IdentityUserDto> GetAsync(Guid id)
    {
        return ObjectMapper.Map<Volo.Abp.Identity.IdentityUser, IdentityUserDto>(
            await _userManager.GetByIdAsync(id)
        );
    }

    [RemoteService(IsEnabled = false)]
    public async Task<PagedResultDto<IdentityUserDto>> GetListAsync(GetIdentityUsersInput input)
    {
        var count = await _userRepository.GetCountAsync(input.Filter);
        var list = await _userRepository.GetListAsync(input.Sorting, input.MaxResultCount, input.SkipCount,
            input.Filter);
        return new PagedResultDto<IdentityUserDto>(
            count,
            ObjectMapper.Map<List<Volo.Abp.Identity.IdentityUser>, List<IdentityUserDto>>(list)
        );
    }

    [RemoteService(IsEnabled = false)]
    public async Task DeleteAsync(Guid id)
    {
        if (CurrentUser.Id == id)
        {
            throw new BusinessException(code: IdentityErrorCodes.UserSelfDeletion);
        }

        var user = await _userManager.FindByIdAsync(id.ToString());
        if (user == null)
        {
            return;
        }

        (await _userManager.DeleteAsync(user)).CheckErrors();
    }

    [RemoteService(IsEnabled = false)]
    public async Task<ListResultDto<IdentityRoleDto>> GetRolesAsync(Guid id)
    {
        var roles = await _userRepository.GetRolesAsync(id);
        return new ListResultDto<IdentityRoleDto>(
            ObjectMapper.Map<List<Volo.Abp.Identity.IdentityRole>, List<IdentityRoleDto>>(roles));
    }

    [RemoteService(IsEnabled = false)]
    public async Task<ListResultDto<IdentityRoleDto>> GetAssignableRolesAsync()
    {
        var list = await _roleRepository.GetListAsync();
        return new ListResultDto<IdentityRoleDto>(
            ObjectMapper.Map<List<Volo.Abp.Identity.IdentityRole>, List<IdentityRoleDto>>(list));
    }

    [RemoteService(IsEnabled = false)]
    public async Task UpdateRolesAsync(Guid id, IdentityUserUpdateRolesDto input)
    {
        var user = await _userManager.GetByIdAsync(id);
        (await _userManager.SetRolesAsync(user, input.RoleNames)).CheckErrors();
        await _userRepository.UpdateAsync(user);
    }

    [RemoteService(IsEnabled = false)]
    public async Task<IdentityUserDto?> FindByUsernameAsync(string userName)
    {
        var user = await _userManager.FindByNameAsync(userName);
        return user != null ? ObjectMapper.Map<Volo.Abp.Identity.IdentityUser, IdentityUserDto>(user) : null;
    }

    [RemoteService(IsEnabled = false)]
    public async Task<IdentityUserDto?> FindByEmailAsync(string email)
    {
        var user = await _userManager.FindByEmailAsync(email);

        var xxx = user!.GetProperty<string>("xxx"); // 获取值
        user!.SetProperty("xxx", "xx"); // 设置值
        return user != null ? ObjectMapper.Map<Volo.Abp.Identity.IdentityUser, IdentityUserDto>(user) : null;
    }

    [RemoteService(IsEnabled = false)]
    public async Task<IdentityUserDetailDto> GetAsyncDetail(Guid id)
    {
        var identityUser = await _userRepository.GetAsync(id);
        var detail = ObjectMapper.Map<Volo.Abp.Identity.IdentityUser, IdentityUserDetailDto>(identityUser);
        var organization = await _userManager.GetOrganizationUnitsAsync(identityUser);
        detail.OrganizationId = organization.FirstOrDefault()?.Id;
        var roles = await _userManager.GetRolesAsync(identityUser);
        detail.RoleNames = roles.ToArray();
        return detail;
    }

    [RemoteService(IsEnabled = false)]
    public async Task UpdateAvatarAsync(Guid id, UserAvatarUpdateDto input)
    {
        await _identityOptions.SetAsync();

        var user = await _userManager.GetByIdAsync(id);

        user.SetConcurrencyStampIfNotNull(input.ConcurrencyStamp);

        input.MapExtraPropertiesTo(user);

        (await _userManager.UpdateAsync(user)).CheckErrors();

        await CurrentUnitOfWork?.SaveChangesAsync()!;
    }

    [RemoteService(IsEnabled = false)]
    public async Task<IEnumerable<SearchUserOutputDto>> GetUsersAsync(SearchUserListInputDto input)
    {
        var list = await _userRepository.GetListAsync(input.Sorting, input.MaxResultCount, 0,
            input.Filter);
        var users = list.Select(u => new SearchUserOutputDto()
        {
            Id = u.Id,
            UserName = u.UserName,
            FullName = $"{u.UserName}{u.Surname}"
        });
        return users;
    }

    [RemoteService(IsEnabled = false)]
    public async Task<IEnumerable<RoleDto>> GetRoleAsync()
    {
        var list = await _roleRepository.GetListAsync(null, 999);
        return ObjectMapper.Map<List<Volo.Abp.Identity.IdentityRole>, IEnumerable<RoleDto>>(list);
    }

    private async Task UpdateUserByInput(Volo.Abp.Identity.IdentityUser user, IdentityUserCreateOrUpdateDtoBase input)
    {
        if (!string.Equals(user.Email, input.Email, StringComparison.InvariantCultureIgnoreCase))
        {
            (await _userManager.SetEmailAsync(user, input.Email)).CheckErrors();
        }

        if (!string.Equals(user.PhoneNumber, input.PhoneNumber, StringComparison.InvariantCultureIgnoreCase))
        {
            (await _userManager.SetPhoneNumberAsync(user, input.PhoneNumber)).CheckErrors();
        }

        if (user.Id != CurrentUser.Id)
        {
            (await _userManager.SetLockoutEnabledAsync(user, input.LockoutEnabled)).CheckErrors();
        }

        user.Name = input.Name;
        user.Surname = input.Surname;
        (await _userManager.UpdateAsync(user)).CheckErrors();
        user.SetIsActive(input.IsActive);
        if (input.RoleNames != null)
        {
            (await _userManager.SetRolesAsync(user, input.RoleNames)).CheckErrors();
        }
    }
}