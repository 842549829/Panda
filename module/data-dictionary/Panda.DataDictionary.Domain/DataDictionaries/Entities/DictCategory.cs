using Panda.Domain.Shared.Enums;

namespace Panda.DataDictionary.Domain.DataDictionaries.Entities;

public class DictCategory : DictEntity
{
    public DictCategory(string key, string name, Enable status, int sort, string describe, string alias, string code, Guid? parnetId, Guid? tenantId) : base(key, name, status, sort, describe, code, parnetId, tenantId)
    {
        Alias = alias;
    }

    public string Alias { get; set; }
}