using System;
using Volo.Abp.Identity;

namespace Panda.Net.Bases.Users.Dtos;

public class UserUpdateDto : IdentityUserUpdateDto
{
    public Guid OrganizationId { get; set; }
}