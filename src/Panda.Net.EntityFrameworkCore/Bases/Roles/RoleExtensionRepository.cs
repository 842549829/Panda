using Microsoft.EntityFrameworkCore;
using Panda.Net.Bases.Roles.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Volo.Abp.EntityFrameworkCore;
using Volo.Abp.Identity;
using Volo.Abp.Identity.EntityFrameworkCore;

namespace Panda.Net.Bases.Roles;

public class RoleExtensionRepository : EfCoreIdentityRoleRepository, IRoleExtensionRepository
{
    public RoleExtensionRepository(IDbContextProvider<IIdentityDbContext> dbContextProvider) : base(dbContextProvider)
    {
    }

    public async Task<List<IdentityRole>> GetRoleAsync(string[] roles)
    {
        var dbSet = await GetDbSetAsync();
        return await dbSet.Where(a => roles.Contains(a.NormalizedName))
            .ToListAsync();
    }
}