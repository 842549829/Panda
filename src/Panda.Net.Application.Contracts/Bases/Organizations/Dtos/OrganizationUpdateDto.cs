using System;
using Volo.Abp.Domain.Entities;
using Volo.Abp.ObjectExtending;

namespace Panda.Net.Bases.Organizations.Dtos;

public class OrganizationUpdateDto : ExtensibleObject, IHasConcurrencyStamp
{
    public string ConcurrencyStamp { get; set; }

    public virtual string DisplayName { get; set; }
}