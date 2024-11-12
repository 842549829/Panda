using Panda.DataPermission.Abstractions.DataPermission;
using Panda.Domain.Entities;

namespace Panda.DataDictionary.Domain.DataDictionaries.Entities;

/// <summary>
/// 常量值
/// </summary>
public class ConstValue : FullHealthcareAuditedAggregateRoot<Guid>, IDataPermission
{
    public ConstValue(Guid id, string name, string code, string value) : base(id, name, code)
    {
        Value = value;
    }
    
    public string Value { get; private set; } 

    /// <summary>
    /// Hierarchical Code of this organization unit.
    /// Example: "00001.00042.00005".
    /// This is a unique code for an OrganizationUnit.
    /// It's changeable if OU hierarchy is changed.
    /// </summary>
    public string OrganizationCode { get; set; }
}