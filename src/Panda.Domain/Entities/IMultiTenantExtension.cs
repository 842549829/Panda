using Volo.Abp.MultiTenancy;

namespace Panda.Domain.Entities;

public interface IMultiTenantExtension : IMultiTenant
{
    public void ChangeTenant(Guid? tenantId);
}