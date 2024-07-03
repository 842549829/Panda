using System.Threading.Tasks;
using System;
using System.Collections.Generic;
using Volo.Abp.Domain.Services;

namespace Panda.Net.Bases.Users.Managers;

public interface IUserManager : IDomainService
{
    Task<Volo.Abp.Identity.IdentityUser> GetByIdAsync(Guid id);

    Task<List<Volo.Abp.Identity.IdentityUser>> GetUsersInRoleAsync(string roleName);
}