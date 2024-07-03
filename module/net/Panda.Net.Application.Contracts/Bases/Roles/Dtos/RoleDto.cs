using System.Collections.Generic;
using Volo.Abp.Identity;
using Volo.Abp.PermissionManagement;

namespace Panda.Net.Bases.Roles.Dtos;

public class RoleDto : IdentityRoleDto
{
    public List<UpdatePermissionDto> Permissions { get; set; } = new();
}