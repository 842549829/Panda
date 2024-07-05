namespace Panda.Net.Bases.Permissions.Dtos;

public class DataPermissionDto
{
    public DataPermission.Abstractions.DataPermission.DataPermission DataPermission { get; set; }

    public string CustomDataPermission { get; set; } = default!;
}