using Panda.Domain.Shared.Enums;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Domain.Entities;

namespace Panda.DataDictionary.Application.Contracts.DataDictionaries.DictCategories.Dtos;

public class DictItemDto : ExtensibleEntityDto<Guid>, IHasConcurrencyStamp
{
    public Guid CategoryId { get; set; }

    public string ConcurrencyStamp { get; set; } = default!;

    public string? Style { get; set; } 

    public string Value { get; set; } = default!;

    public Guid? ParentId { get; set; }

    public Guid? TenantId { get; set; }

    public Enable Status { get; set; }

    public string Name { get; set; } = default!;

    public string Key { get; set; } = default!;

    public string Describe { get; set; } = default!;

    public string Code { get; set; } = default!;

    public int Sort { get; set; } = default!;
}