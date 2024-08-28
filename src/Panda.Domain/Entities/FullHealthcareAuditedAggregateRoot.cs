namespace Panda.Domain.Entities;

public abstract class FullHealthcareAuditedAggregateRoot<TKey>(TKey id, string name, string code) : HealthcareAuditedAggregateRoot<TKey>(id, name, code),
    IHasOrganizationExtension
{
    protected FullHealthcareAuditedAggregateRoot(TKey id, string name) : this(id, name, string.Empty)
    {
    }

    public Guid OrganizationId { get; private set; }

    public void SetOrganization(Guid organizationId)
    {
        OrganizationId = organizationId;
    }
}