namespace Panda.DataDictionary.Application.Contracts.DataDictionaries.DictCategories.Dtos;

public class DictCategoryCreateDto : DictCategoryCreateOrUpdateDtoBase
{
    public Guid? ParentId { get; set; }

    public string Key { get; set; } = default!;
}