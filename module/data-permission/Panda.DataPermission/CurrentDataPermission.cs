using Panda.DataPermission.Abstractions.DataPermission;
using Volo.Abp;
using Volo.Abp.DependencyInjection;

namespace Panda.DataPermission
{
    public class CurrentDataPermission : ICurrentDataPermission, ITransientDependency
    {
        public bool IsAvailable => !string.IsNullOrWhiteSpace(Code);

        public string? Code => _currentDataPermissionAccessor.Current?.Code;

        public Abstractions.DataPermission.DataPermission? DataPermission => _currentDataPermissionAccessor.Current?.DataPermission;

        private readonly ICurrentDataPermissionAccessor _currentDataPermissionAccessor;

        public CurrentDataPermission(ICurrentDataPermissionAccessor currentDataPermissionAccessor)
        {
            _currentDataPermissionAccessor = currentDataPermissionAccessor;
        }

        public IDisposable Change(string? code = null, Abstractions.DataPermission.DataPermission? dataPermission = null)
        {
            return SetCurrent(code, dataPermission);
        }

        private IDisposable SetCurrent(string? code, Abstractions.DataPermission.DataPermission? dataPermission)
        {
            var parentScope = _currentDataPermissionAccessor.Current;
            _currentDataPermissionAccessor.Current = new BasicDataPermissionInfo(code, dataPermission);

            return new DisposeAction<ValueTuple<ICurrentDataPermissionAccessor, BasicDataPermissionInfo?>>(static (state) =>
            {
                var (currentTenantAccessor, parentScope) = state;
                currentTenantAccessor.Current = parentScope;
            }, (_currentDataPermissionAccessor, parentScope));
        }
    }
}