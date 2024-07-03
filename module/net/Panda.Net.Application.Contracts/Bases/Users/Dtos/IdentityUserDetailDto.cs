using System;
using Volo.Abp.Identity;

namespace Panda.Net.Bases.Users.Dtos;

public class IdentityUserDetailDto : IdentityUserDto
{
    public Guid? OrganizationId { get; set; }
    
    public string[] RoleNames { get; set; }
}