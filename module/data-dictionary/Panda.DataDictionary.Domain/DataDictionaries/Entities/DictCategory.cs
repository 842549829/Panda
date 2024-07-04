using Panda.Domain.Shared.Enums;

namespace Panda.DataDictionary.Domain.DataDictionaries.Entities;

public class DictCategory : DictEntity
{
    public DictCategory(Guid id, string key, string name, Enable status, int sort, string describe, string alias, string code, Guid? parnetId, Guid? tenantId) : base(id, key, name, status, sort, describe, code, parnetId, tenantId)
    {
        Alias = alias;
    }

    public string Alias { get; set; }

    public ICollection<DictItem> Items { get; set; } = default!;

    public void Update(string name, int sort, string describe, string alias)
    {
        Update(name, sort, describe);
        Alias = alias;
    }
}