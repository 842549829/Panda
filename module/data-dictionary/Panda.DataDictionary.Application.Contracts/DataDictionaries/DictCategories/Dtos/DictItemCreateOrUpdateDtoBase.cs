using Volo.Abp.ObjectExtending;

namespace Panda.DataDictionary.Application.Contracts.DataDictionaries.DictCategories.Dtos;

public class DictItemCreateOrUpdateDtoBase : ExtensibleObject
{
    public string? Style { get; set; }

    public string Name { get; set; } = default!;

    public string Describe { get; set; } = default!;

    public int Sort { get; set; } = default!;
}