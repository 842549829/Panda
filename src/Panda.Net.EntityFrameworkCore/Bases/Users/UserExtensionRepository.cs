using Microsoft.EntityFrameworkCore;
using Panda.Net.Bases.Users.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Volo.Abp.EntityFrameworkCore;
using Volo.Abp.Identity;
using Volo.Abp.Identity.EntityFrameworkCore;
using Volo.Abp.Users.EntityFrameworkCore;

namespace Panda.Net.Bases.Users;

public class UserExtensionRepository : EfCoreUserRepositoryBase<IdentityDbContext, IdentityUser>, IUserExtensionRepository
{
    public UserExtensionRepository(IDbContextProvider<IdentityDbContext> dbContextProvider) : base(dbContextProvider)
    {
    }

    public async Task<List<IdentityUser>> GetAllAsync()
    {
        var dbSet = await GetDbSetAsync();
        return await dbSet.ToListAsync();
    }

    public async Task<List<IdentityUser>> GetByRoleIdAsync(Guid roleId)
    {
        var dbContext = await GetDbContextAsync();
        var queryable = from identityUser in dbContext.Set<IdentityUser>()
                        join identityUserRole in dbContext.Set<IdentityUserRole>() on identityUser.Id equals identityUserRole.UserId
                        where identityUserRole.RoleId == roleId
                        orderby identityUser.CreationTime descending
                        select identityUser;
        return await queryable.ToListAsync();
    }

    public async Task<List<IdentityUser>> GetTestAsync()
    {
        var dbSet = await GetDbSetAsync();
        return await dbSet.Where(a => EF.Property<string>(a, "xxxx") == "xxxx").ToListAsync();
    }
}