using Panda.DataPermission.Abstractions.DataPermission;

namespace Panda.DataPermission;

public class AsyncLocalCurrentDataPermissionAccessor : ICurrentDataPermissionAccessor
{
    public static AsyncLocalCurrentDataPermissionAccessor Instance { get; } = new();

    public BasicDataPermissionInfo? Current
    {
        get => _currentScope.Value;
        set => _currentScope.Value = value;
    }

    private readonly AsyncLocal<BasicDataPermissionInfo?> _currentScope;

    private AsyncLocalCurrentDataPermissionAccessor()
    {
        _currentScope = new AsyncLocal<BasicDataPermissionInfo?>();
    }
}