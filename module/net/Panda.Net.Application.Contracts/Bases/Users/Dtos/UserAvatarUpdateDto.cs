using Volo.Abp.Domain.Entities;
using Volo.Abp.ObjectExtending;

namespace Panda.Net.Bases.Users.Dtos;

public class UserAvatarUpdateDto : ExtensibleObject, IHasConcurrencyStamp
{
    public string ConcurrencyStamp { get; set; }
}