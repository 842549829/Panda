using System;
using Volo.Abp.Application.Dtos;

namespace Panda.Net.Bases.Permissions.Dtos;

public class PermissionGroupDefinitionDto : ExtensibleEntityDto<Guid>
{
    public string Name { get; set; }

    public string DisplayName { get; set; }
}