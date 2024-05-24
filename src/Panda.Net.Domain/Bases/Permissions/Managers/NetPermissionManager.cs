using Panda.Net.Bases.Permissions.Repositories;
using Panda.Net.Constants;
using Panda.Net.Enums;
using Panda.Net.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Volo.Abp.Authorization.Permissions;
using Volo.Abp.Data;
using Volo.Abp.Domain.Repositories;
using Volo.Abp.Identity;
using Volo.Abp.PermissionManagement;
using Volo.Abp.PermissionManagement.Identity;

namespace Panda.Net.Bases.Permissions.Managers;

public class NetPermissionManager : NetDomainService, INetPermissionManager
{
    private const string ProviderName = RolePermissionValueProvider.ProviderName;

    private readonly RolePermissionManagementProvider _rolePermissionManagementProvider;
    private readonly IPermissionGrantRepository _permissionGrantRepository;
    private readonly IRepository<PermissionGroupDefinitionRecord> _permissionGroupDefinitionRecordRepository;
    private readonly IRepository<PermissionDefinitionRecord> _permissionDefinitionRecordRepository;
    private readonly IIdentityUserRepository _userRepository;
    private readonly IPermissionRepository _permissionRepository;

    public NetPermissionManager(
        IPermissionGrantRepository permissionGrantRepository,
        IRepository<PermissionGroupDefinitionRecord> permissionGroupDefinitionRecordRepository,
        IRepository<PermissionDefinitionRecord> permissionDefinitionRecordRepository,
        IIdentityUserRepository userRepository,
        IPermissionRepository permissionRepository,
        RolePermissionManagementProvider rolePermissionManagementProvider
    )
    {
        _permissionGrantRepository = permissionGrantRepository;
        _permissionGroupDefinitionRecordRepository = permissionGroupDefinitionRecordRepository;
        _permissionDefinitionRecordRepository = permissionDefinitionRecordRepository;
        _userRepository = userRepository;
        _permissionRepository = permissionRepository;
        _rolePermissionManagementProvider = rolePermissionManagementProvider;
    }

    public async Task<IdentityRole> SetPermissionAsync(
        IdentityRole entity,
        List<UpdatePermission> updatePermissions)
    {
        if (updatePermissions.IsNullOrEmpty())
        {
            return entity;
        }

        // 功能权限
        foreach (var item in updatePermissions)
        {
            await _rolePermissionManagementProvider.SetAsync(item.Name, entity.Name, item.IsGranted);
        }

        return entity;
    }

    public Task<List<PermissionGrant>> GetPermissionGrantListAsync(string providerName, string providerKey,
        CancellationToken cancellationToken = default)
    {
        return _permissionGrantRepository.GetListAsync(providerName, providerKey, cancellationToken);
    }

    public async Task<List<PermissionTree>> GetAllPermissionTreeListAsync()
    {
        var permissionGroupDefinitionRecords =
            await _permissionGroupDefinitionRecordRepository.GetListAsync(d => d.Name.StartsWith("Panda.Net."));
        var permissionDefinitionRecords =
            await _permissionDefinitionRecordRepository.GetListAsync(d => d.Name.StartsWith("Panda.Net."));
        var permissions = CreatePermissionTree(permissionGroupDefinitionRecords, permissionDefinitionRecords);
        var result = ConvertToTree(permissions);
        return result;
    }

    public async Task<List<PermissionTree>> GetPermissionTreeListAsync(Guid userId)
    {
        // 获取当前用户的角色
        var roles = await _userRepository.GetRolesAsync(userId);
        var providerKey = roles.Select(a => a.Name).ToArray();
        var rolePermission =
            await _permissionRepository.GetPermissionListAsync(RolePermissionValueProvider.ProviderName, providerKey);
        var user = await GetPermissionGrantListAsync(UserPermissionValueProvider.ProviderName, userId.ToString());
        var permissionGrants = rolePermission.Union(user).Select(a => a.Name).Distinct();
        var permissionDefinitionRecords =
            await _permissionDefinitionRecordRepository.GetListAsync(d => permissionGrants.Contains(d.Name));
        var groupNames = permissionDefinitionRecords.Select(a => a.GroupName).Distinct().ToArray();
        var permissionGroupDefinitionRecords =
            await _permissionGroupDefinitionRecordRepository.GetListAsync(d => groupNames.Contains(d.Name));
        var permissions = CreatePermissionTree(permissionGroupDefinitionRecords, permissionDefinitionRecords);
        var result = ConvertToTree(permissions);
        return result;
    }

    public async Task<List<PermissionGroupDefinitionRecord>> GetPermissionGroupDefinitionListAsync()
    {
        var permissionGroupDefinitionRecords = await _permissionGroupDefinitionRecordRepository.GetListAsync();
        foreach (var permissionGroupDefinitionRecord in permissionGroupDefinitionRecords)
        {
            permissionGroupDefinitionRecord.DisplayName = L.DisplayValue(permissionGroupDefinitionRecord.DisplayName);
        }

        return permissionGroupDefinitionRecords;
    }

    public async Task<List<PermissionDefinitionRecord>> GetPermissionDefinitionListAsync(string groupName)
    {
        var permissionDefinitionRecords =
            await _permissionDefinitionRecordRepository.GetListAsync(d => d.GroupName == groupName);
        foreach (var permissionDefinitionRecord in permissionDefinitionRecords)
        {
            permissionDefinitionRecord.DisplayName = L.DisplayValue(permissionDefinitionRecord.DisplayName);
        }
        return permissionDefinitionRecords;
    }

    private List<PermissionTree> CreatePermissionTree(
        List<PermissionGroupDefinitionRecord> permissionGroupDefinitionRecords,
        List<PermissionDefinitionRecord> permissionDefinitionRecords)
    {
        var permissions = new List<PermissionTree>();
        foreach (var permissionGroupDefinitionRecord in permissionGroupDefinitionRecords)
        {
            var modulePermission = new PermissionTree(permissionGroupDefinitionRecord.Name,
                L.DisplayValue(permissionGroupDefinitionRecord.DisplayName),
                PermissionType.Module,
                path: permissionGroupDefinitionRecord.GetProperty<string>(PermissionDefinitionConsts.Path),
                iocn: permissionGroupDefinitionRecord.GetProperty<string>(PermissionDefinitionConsts.Icon));
            var menuList = permissionDefinitionRecords.Where(d => d.GroupName == modulePermission.Name);
            permissions.AddRange(menuList.Select(menu =>
                new PermissionTree(menu.Name, L.DisplayValue(menu.DisplayName),
                    type: (PermissionType?)menu.GetProperty<int?>(PermissionDefinitionConsts.Type),
                    path: menu.GetProperty<string?>(PermissionDefinitionConsts.Path),
                    iocn: menu.GetProperty<string?>(PermissionDefinitionConsts.Icon),
                    parentName: menu.ParentName ?? menu.GroupName)));
            permissions.Add(modulePermission);
        }

        return permissions;
    }

    private List<PermissionTree> ConvertToTree(List<PermissionTree> permissions, string? parentName = null)
    {
        var permissionsList = permissions.Where(d => d.ParentName == parentName);
        var list = new List<PermissionTree>();
        foreach (var item in permissionsList)
        {
            var permissionTree = new PermissionTree(item.Name,
                L.DisplayValue(item.DisplayName!),
                item.Type,
                item.Path,
                item.Iocn,
                item.ParentName);
            var children = ConvertToTree(permissions, item.Name);
            foreach (var child in children)
            {
                permissionTree.AddChildPermissions(child);
            }

            list.Add(permissionTree);
        }

        return list;
    }
}