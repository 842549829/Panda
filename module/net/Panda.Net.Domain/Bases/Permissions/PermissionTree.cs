using Panda.Net.Enums;
using System.Collections.Generic;

namespace Panda.Net.Bases.Permissions;

public class PermissionTree
{
    public PermissionTree(string name, string? displayName, PermissionType? type, string? path = null, string? iocn = null, string? parentName = null)
    {
        Name = name;
        DisplayName = displayName;
        Type = type;
        Path = path;
        Iocn = iocn;
        ParentName = parentName;
        ChildPermissions = new List<PermissionTree>();
    }

    public string Name { get; private set; }

    public string? ParentName { get; private set; }

    public string? Path { get; set; }

    public string? Iocn { get; set; }

    public string? DisplayName { get; private set; }

    public PermissionType? Type { get; private set; }

    public List<PermissionTree> ChildPermissions { get; private set; }

    public void AddChildPermissions(PermissionTree child)
    {
        ChildPermissions.Add(child);
    }
}