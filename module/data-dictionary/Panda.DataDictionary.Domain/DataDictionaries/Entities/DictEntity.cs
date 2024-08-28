using Panda.DataPermission.Abstractions.DataPermission;
using Panda.Domain.Entities;
using Panda.Domain.Shared.Enums;
using Volo.Abp;

namespace Panda.DataDictionary.Domain.DataDictionaries.Entities;

public abstract class DictEntity : FullHealthcareAuditedAggregateRoot<Guid>, IDataPermission
{
    protected DictEntity(Guid id, string key, string name, Enable status, int sort, string describe, string code, Guid? parentId, Guid? tenantId, string organizationCode)
    : base(id, name, code)
    {
        Check.NotNull(key, nameof(key));
        Check.NotNull(organizationCode, nameof(organizationCode));

        Key = key;
        ParentId = parentId;
        OrganizationCode = organizationCode;

        SetStatus(status);
        SetSort(sort);
        SetDescribe(describe);
        SetTenant(tenantId);
    }

    public Guid? ParentId { get; set; }

    public string Key { get; set; }

    /// <summary>
    /// Hierarchical Code of this organization unit.
    /// Example: "00001.00042.00005".
    /// This is a unique code for an OrganizationUnit.
    /// It's changeable if OU hierarchy is changed.
    /// </summary>
    public string OrganizationCode { get; set; }
}