using System;
using Volo.Abp.Identity;

namespace Panda.Net.Bases.Users.Dtos;

public class UserCreateDto : IdentityUserCreateDto
{
    public Guid OrganizationId { get; set; }
}