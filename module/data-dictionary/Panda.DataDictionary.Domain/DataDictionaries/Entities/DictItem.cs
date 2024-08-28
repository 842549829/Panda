using Panda.Domain.Shared.Enums;
using Volo.Abp;

namespace Panda.DataDictionary.Domain.DataDictionaries.Entities;

public class DictItem(
    Guid id,
    Guid categoryId,
    string key,
    string value,
    string name,
    Enable status,
    int sort,
    string describe,
    string style,
    string code,
    Guid? parentId,
    Guid? tenantId,
    string organizationCode)
    : DictEntity(id, key, name, status, sort, describe, code, parentId, tenantId, organizationCode)
{
    public Guid CategoryId { get; set; } = categoryId;

    public DictCategory Category { get; set; } = default!;

    public string Style { get; set; } = style;

    public string Value { get; set; } = value;

    public void Update(string name, int sort, string describe, string style)
    {
        Check.NotNull(describe, nameof(describe));
        Check.NotNull(style, nameof(style));
        SetName(name);
        SetSort(sort);
        SetDescribe(describe);
        Style = style;
    }
}