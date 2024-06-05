namespace Panda.DataPermission.Abstractions.DataPermission;

public interface ICurrentDataPermissionAccessor
{
    BasicDataPermissionInfo? Current { get; set; }
}