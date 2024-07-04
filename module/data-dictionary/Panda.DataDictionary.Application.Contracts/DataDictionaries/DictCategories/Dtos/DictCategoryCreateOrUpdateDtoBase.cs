using Volo.Abp.ObjectExtending;

namespace Panda.DataDictionary.Application.Contracts.DataDictionaries.DictCategories.Dtos;

public class DictCategoryCreateOrUpdateDtoBase : ExtensibleObject
{
    public string Alias { get; set; } = default!;

    public string Name { get; set; } = default!;

    public string Describe { get; } = default!;

    public int Sort { get; set; } = default!;
}