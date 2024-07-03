using Panda.DataPermission.Abstractions.DataPermission;
using Panda.Domain.Entities;
using Panda.Domain.Shared.Enums;
using Volo.Abp.Domain.Entities.Auditing;
using Volo.Abp.MultiTenancy;

namespace Panda.DataDictionary.Domain.DataDictionaries.Entities;

public abstract class DictEntity : FullAuditedAggregateRoot<Guid>, IMultiTenant, IEnable, ISort, IDataPermission
{
    protected DictEntity(string key, string name, Enable status, int sort, string describe, string code, Guid? parnetId, Guid? tenantId)
    {
        Key = key;
        Name = name;
        Status = status;
        Sort = sort;
        Describe = describe;
        Code = code;
        ParnetId = parnetId;
        TenantId = tenantId;
    }

    public Guid? ParnetId { get; set; }

    public Guid? TenantId { get; set; }

    public Enable Status { get; set; }

    public string Name { get; set; }

    public string Key { get; set; }

    public string Describe { get; }

    public string Code { get; set; }

    public int Sort { get; set; }

    public void ChangeStatus(Enable status)
    {
        Status = status;
    }
}