using Volo.Abp.MultiTenancy;

namespace Panda.Domain.Entities;

public interface IMultiTenantExtension : IMultiTenant
{
    public void SetTenant(Guid? tenantId);
}