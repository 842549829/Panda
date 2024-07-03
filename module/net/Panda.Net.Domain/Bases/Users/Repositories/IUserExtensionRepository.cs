using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Identity;

namespace Panda.Net.Bases.Users.Repositories;

public interface IUserExtensionRepository : ITransientDependency
{
    Task<List<IdentityUser>> GetAllAsync();

    Task<List<IdentityUser>> GetByRoleIdAsync(Guid roleId);
}