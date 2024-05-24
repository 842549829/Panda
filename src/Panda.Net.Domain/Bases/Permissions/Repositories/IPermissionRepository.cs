using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using Volo.Abp.DependencyInjection;
using Volo.Abp.PermissionManagement;

namespace Panda.Net.Bases.Permissions.Repositories;

public interface IPermissionRepository : ITransientDependency
{
    Task<List<PermissionGrant>> GetPermissionListAsync(string providerName, string[] providerKey, CancellationToken cancellationToken = default);
}