using Panda.Domain.Shared.Enums;

namespace Panda.DataDictionary.Domain.DataDictionaries.Entities;

public class DictItem : DictEntity
{
    public DictItem(Guid id, string key, string value, string name, Enable status, int sort, string describe, string style, string code, Guid? parnetId, Guid? tenantId) : base(id, key, name, status, sort, describe, code, parnetId, tenantId)
    {
        Style = style;
        Value = value;
    }

    public string Style { get; set; }

    public string Value { get; set; }
}