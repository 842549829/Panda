namespace Panda.Domain.Entities;

public abstract class FullHealthcareAuditedAggregateRoot<TKey>(string name, string code) : HealthcareAuditedAggregateRoot<TKey>(name, code),
    IHasOrganizationExtension
{
    protected FullHealthcareAuditedAggregateRoot(string name) : this(name, string.Empty)
    {
    }

    public Guid OrganizationId { get; private set; }

    public void SetOrganization(Guid organizationId)
    {
        OrganizationId = organizationId;
    }
}