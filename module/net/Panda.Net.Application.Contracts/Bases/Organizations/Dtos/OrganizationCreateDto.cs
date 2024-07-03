using System;
using Volo.Abp.ObjectExtending;

namespace Panda.Net.Bases.Organizations.Dtos;

public class OrganizationCreateDto : ExtensibleObject
{
    public Guid? ParentId { get; set; }

    public string DisplayName { get; set; }
}