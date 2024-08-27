namespace Panda.Domain.Entities;

public interface IHasOrganizationExtension : IHasOrganization
{
    public void SetOrganization(Guid organizationId);
}