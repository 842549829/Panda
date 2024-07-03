using Microsoft.EntityFrameworkCore;
using Panda.Net.Bases.Permissions.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Volo.Abp.Domain.Repositories.EntityFrameworkCore;
using Volo.Abp.EntityFrameworkCore;
using Volo.Abp.PermissionManagement;
using Volo.Abp.PermissionManagement.EntityFrameworkCore;

namespace Panda.Net.Bases.Permissions;

public class PermissionRepository : EfCoreRepository<IPermissionManagementDbContext, PermissionGrant, Guid>, IPermissionRepository
{
    public PermissionRepository(IDbContextProvider<IPermissionManagementDbContext> dbContextProvider) : base(dbContextProvider)
    {
    }

    public async Task<List<PermissionGrant>> GetPermissionListAsync(string providerName, string[] providerKey, CancellationToken cancellationToken = default)
    {
        return await (await GetDbSetAsync())
            .Where(s =>
                s.ProviderName == providerName &&
                providerKey.Contains(s.ProviderKey)
            )
            .Distinct()
            .ToListAsync(GetCancellationToken(cancellationToken));
    }
}