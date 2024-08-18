using Panda.Domain.Shared.Enums;
using Panda.Domain.Shared.Extensions;
using Volo.Abp.Domain.Entities.Auditing;
using Volo.Abp.MultiTenancy;

namespace Panda.Domain.Entities;

public class FullAuditedAggregateHealthcare<TKey>(string name, string code) :
    FullAuditedAggregateRoot<TKey>,
    IMayHaveCreatorName,
    IMayHaveModificationName,
    IMayHaveDeletionName,
    IMultiTenant,
    IHasEnable,
    IHasSort,
    IHasPinyin,
    IHasName,
    IHasCode,
    IMayHaveDescribe,
    IHasOrganization
{
    public FullAuditedAggregateHealthcare(string name) : this(name, string.Empty)
    {
    }

    public Guid? TenantId { get; private set; }

    public Guid OrganizationId { get; private set; }

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

    public void ChangeSort(int sort)
    {
        Sort = sort;
    }

    public void ChangeStatus(Enable status)
    {
        Status = status;
    }
}