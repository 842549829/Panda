using Microsoft.AspNetCore.Identity;
using Panda.Net.Bases.Permissions;
using Panda.Net.Bases.Permissions.Managers;
using Panda.Net.Bases.Roles.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Authorization.Permissions;
using Volo.Abp.Data;
using Volo.Abp.Identity;
using Volo.Abp.ObjectExtending;
using Volo.Abp.PermissionManagement;

namespace Panda.Net.Bases.Roles;

public class RoleAppService : NetAppService, IRoleAppService
{
    private readonly IdentityRoleManager _roleManager;
    private readonly IIdentityRoleRepository _roleRepository;
    private readonly INetPermissionManager _netPermissionManager;

    public RoleAppService(
        IdentityRoleManager roleManager,
        IIdentityRoleRepository roleRepository,
        INetPermissionManager netPermissionManager)
    {
        _roleManager = roleManager;
        _roleRepository = roleRepository;
        _netPermissionManager = netPermissionManager;
    }

    [RemoteService(IsEnabled = false)]
    public async Task<IdentityRoleDto> CreateAsync(RoleCreateDto input)
    {
        var role = new Volo.Abp.Identity.IdentityRole(
            GuidGenerator.Create(),
            input.Name,
            CurrentTenant.Id
        )
        {
            IsDefault = input.IsDefault,
            IsPublic = input.IsPublic
        };

        input.MapExtraPropertiesTo(role);

        (await _roleManager.CreateAsync(role)).CheckErrors();

        await SetPermissionAsync(role, input.Permissions);

        await CurrentUnitOfWork?.SaveChangesAsync()!;

        return ObjectMapper.Map<Volo.Abp.Identity.IdentityRole, IdentityRoleDto>(role);
    }

    [RemoteService(IsEnabled = false)]
    public async Task<IdentityRoleDto> UpdateAsync(Guid id, RoleUpdateDto input)
    {
        var role = await _roleManager.GetByIdAsync(id);

        role.SetConcurrencyStampIfNotNull(input.ConcurrencyStamp);

        (await _roleManager.SetRoleNameAsync(role, input.Name)).CheckErrors();

        role.IsDefault = input.IsDefault;
        role.IsPublic = input.IsPublic;

        input.MapExtraPropertiesTo(role);

        (await _roleManager.UpdateAsync(role)).CheckErrors();

        await SetPermissionAsync(role, input.Permissions);

        await CurrentUnitOfWork?.SaveChangesAsync()!;

        return ObjectMapper.Map<Volo.Abp.Identity.IdentityRole, IdentityRoleDto>(role);
    }

    [RemoteService(IsEnabled = false)]
    public async Task DeleteAsync(Guid id)
    {
        var role = await _roleManager.FindByIdAsync(id.ToString());
        if (role == null)
        {
            return;
        }

        (await _roleManager.DeleteAsync(role)).CheckErrors();
    }

    [RemoteService(IsEnabled = false)]
    public async Task<PagedResultDto<IdentityRoleDto>> GetListAsync(GetIdentityRolesInput input)
    {
        var list = await _roleRepository.GetListAsync(input.Sorting, input.MaxResultCount, input.SkipCount,
            input.Filter);
        var totalCount = await _roleRepository.GetCountAsync(input.Filter);

        return new PagedResultDto<IdentityRoleDto>(
            totalCount,
            ObjectMapper.Map<List<Volo.Abp.Identity.IdentityRole>, List<IdentityRoleDto>>(list)
        );
    }

    [RemoteService(IsEnabled = false)]
    public async Task<RoleDto> GetAsync(Guid id)
    {
        var identityRole = await _roleManager.GetByIdAsync(id);
        var dto = ObjectMapper.Map<Volo.Abp.Identity.IdentityRole, RoleDto>(identityRole);
        var permissionGrants =
            await _netPermissionManager.GetPermissionGrantListAsync(RolePermissionValueProvider.ProviderName, dto.Name);
        permissionGrants.ForEach(x =>
        {
            dto.Permissions.Add(new UpdatePermissionDto
            {
                Name = x.Name,
                IsGranted = true
            });
        });
        return dto;
    }

    private async Task SetPermissionAsync(Volo.Abp.Identity.IdentityRole role, List<UpdatePermissionDto> permissions)
    {
        var updatePermissions = ObjectMapper.Map<List<UpdatePermissionDto>, List<UpdatePermission>>(permissions);
        await _netPermissionManager.SetPermissionAsync(role, updatePermissions);
    }

    public async Task<List<string>> GetPermissionListAsync(Guid id, CancellationToken cancellationToken = default)
    {
        var identityRole = await _roleManager.GetByIdAsync(id);
        var permissionGrants =
            await _netPermissionManager.GetPermissionGrantListAsync(RolePermissionValueProvider.ProviderName,
                identityRole.Name, cancellationToken);
        return permissionGrants.Select(x => x.Name).ToList();
    }

    public async Task<List<string>> GetAllAsync()
    {
        var roles = await _roleRepository.GetListAsync();
        return roles.Select(a => a.Name).ToList();
    }
}