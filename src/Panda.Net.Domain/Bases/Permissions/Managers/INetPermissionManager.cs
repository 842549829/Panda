using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using Volo.Abp.Domain.Services;
using Volo.Abp.Identity;
using Volo.Abp.PermissionManagement;

namespace Panda.Net.Bases.Permissions.Managers;

public interface INetPermissionManager : IDomainService
{
    Task<IdentityRole> SetPermissionAsync(
        IdentityRole entity,
        List<UpdatePermission> updatePermissions);

    Task<List<PermissionGrant>> GetPermissionGrantListAsync(
        string providerName,
        string providerKey,
        CancellationToken cancellationToken = default
    );

    Task<List<PermissionTree>> GetAllPermissionTreeListAsync();

    Task<List<PermissionTree>> GetPermissionTreeListAsync(Guid userId);

    Task<List<PermissionGroupDefinitionRecord>> GetPermissionGroupDefinitionListAsync();

    Task<List<PermissionDefinitionRecord>> GetPermissionDefinitionListAsync(string groupName);
}