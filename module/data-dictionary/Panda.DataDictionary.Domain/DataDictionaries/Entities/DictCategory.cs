using Panda.Domain.Shared.Enums;
using Volo.Abp;

namespace Panda.DataDictionary.Domain.DataDictionaries.Entities;

public class DictCategory(
    Guid id,
    string key,
    string name,
    Enable status,
    int sort,
    string describe,
    string alias,
    string code,
    Guid? parentId,
    Guid? tenantId,
    string organizationCode)
    : DictEntity(id, key, name, status, sort, describe, code, parentId, tenantId, organizationCode)
{
    public string Alias { get; set; } = alias;

    public ICollection<DictItem> Items { get; set; } = default!;

    public void Update(string name, int sort, string describe, string alias)
    {
        Check.NotNull(alias, nameof(alias));
        SetName(name);
        SetSort(sort);
        SetDescribe(describe);
        Alias = alias;
    }
}