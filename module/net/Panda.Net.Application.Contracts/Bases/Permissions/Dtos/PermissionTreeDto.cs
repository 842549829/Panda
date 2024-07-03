using Panda.Net.Enums;
using System.Collections.Generic;

namespace Panda.Net.Bases.Permissions.Dtos;

public class PermissionTreeDto
{
    public string Name { get; set; }

    public string? ParentName { get; set; }

    public string? DisplayName { get; set; }

    public string? Path { get; set; }

    public string? Iocn { get; set; }

    public PermissionType? Type { get; set; }

    public List<PermissionTreeDto>? ChildPermissions { get; set; }
}