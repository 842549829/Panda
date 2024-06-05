namespace Panda.DataPermission.Abstractions.DataPermission;

public class BasicDataPermissionInfo
{
    public string? Code { get; }

    public DataPermission? DataPermission { get; }

    public BasicDataPermissionInfo(string? code, DataPermission? permission)
    {
        Code = code;
        DataPermission = permission;
    }
}