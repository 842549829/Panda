using Panda.Net.Bases.Users.Repositories;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Domain.Services;
using Volo.Abp.Identity;

namespace Panda.Net.Bases.Users.Managers;

public class UserManager(IdentityUserManager userManager,
        IdentityRoleManager roleManager,
        IUserExtensionRepository userExtensionRepository)
    : DomainService, IUserManager
{
    public Task<IdentityUser> GetByIdAsync(Guid id)
    {
        return userManager.GetByIdAsync(id);
    }

    public async Task<List<IdentityUser>> GetUsersInRoleAsync(string roleName)
    {
        var role = await roleManager.FindByNameAsync(roleName);
        Check.NotNull(role, nameof(role));
        // 根据角色Id查询用户
        return await userExtensionRepository.GetByRoleIdAsync(role!.Id);
    }
}