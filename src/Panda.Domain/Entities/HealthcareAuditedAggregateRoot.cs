using Panda.Domain.Shared.Enums;
using Panda.Domain.Shared.Extensions;
using Volo.Abp;
using Volo.Abp.Domain.Entities.Auditing;

namespace Panda.Domain.Entities;

public abstract class HealthcareAuditedAggregateRoot<TKey>(TKey id, string name, string code) :
    FullAuditedAggregateRoot<TKey>(id),
    IMayHaveCreatorName,
    IMayHaveModificationName,
    IMayHaveDeletionName,
    IMultiTenantExtension,
    IHasEnableExtension,
    IHasSortExtension,
    IHasNamePinyin,
    IHasNameExtension,
    IHasCodeExtension,
    IMayHaveDescribeExtension
{
    protected HealthcareAuditedAggregateRoot(TKey id, string name) : this(id, name, string.Empty)
    {
    }

    public Guid? TenantId { get; private set; }

    public void SetTenant(Guid? tenantId)
    {
        TenantId = tenantId;
    }

    public string Name { get; private set; } = name;

    public string Code { get; private set; } = code;

    public void SetCode(string code)
    {
        Code = code;
    }

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

    public void SetSort(int sort)
    {
        Sort = sort;
    }

    public void SetStatus(Enable status)
    {
        Status = status;
    }

    public void SetName(string name)
    {
        Check.NotNull(name, nameof(name));
        Name = name;
        Pinyin = PinyinExtension.GetPinyin(name);
        PinyinFirstLetters = PinyinExtension.GetFirstPinyin(name);
    }
}