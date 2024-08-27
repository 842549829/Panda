using Panda.Domain.Shared.Enums;
using Panda.Domain.Shared.Extensions;
using Volo.Abp.Domain.Entities.Auditing;

namespace Panda.Domain.Entities;

public abstract class HealthcareAuditedAggregateRoot<TKey>(string name, string code):
    FullAuditedAggregateRoot<TKey>,
    IMayHaveCreatorName,
    IMayHaveModificationName,
    IMayHaveDeletionName,
    IMultiTenantExtension,
    IHasEnableExtension,
    IHasSortExtension,
    IHasPinyin,
    IHasName,
    IHasCode,
    IMayHaveDescribeExtension
{
    protected HealthcareAuditedAggregateRoot(string name) : this(name, string.Empty)
    {
    }

    public Guid? TenantId { get; private set; }

    public void ChangeTenant(Guid? tenantId)
    {
        TenantId = tenantId;
    }

    public string Name { get; private set; } = name;

    public string Code { get; private set; } = code;

    public string Pinyin { get; private set; } = PinyinExtension.GetPinyin(name);

    public string PinyinFirstLetters { get; private set; } = PinyinExtension.GetFirstPinyin(name);

    public Enable Status { get; private set; }

    public int Sort { get; private set; }

    public string? CreatorName { get; set; }

    public string? ModificationName { get; set; }

    public string? DeletionName { get; set; }

    public string? Describe { get; private set; }

    public void SetDescribe(string? describe)
    {
        Describe = describe;
    }

    public void ChangeSort(int sort)
    {
        Sort = sort;
    }

    public void ChangeStatus(Enable status)
    {
        Status = status;
    }
}