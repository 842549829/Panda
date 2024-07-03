using System;
using Volo.Abp.Application.Dtos;
using Volo.Abp.MultiTenancy;

namespace Panda.Net.Bases.Permissions.Dtos;

public class PermissionDefinitionDto : ExtensibleEntityDto<Guid>
{
    public string GroupName { get; set; }

    public string Name { get; set; }

    public string ParentName { get; set; }

    public string DisplayName { get; set; }

    public bool IsEnabled { get; set; }

    public MultiTenancySides MultiTenancySide { get; set; }

    public string Providers { get; set; }

    public string StateCheckers { get; set; }
}