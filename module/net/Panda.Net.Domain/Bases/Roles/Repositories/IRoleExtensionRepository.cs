using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Identity;

namespace Panda.Net.Bases.Roles.Repositories;

public interface IRoleExtensionRepository : ITransientDependency
{
    Task<List<IdentityRole>> GetRoleAsync(string[] roles);
}