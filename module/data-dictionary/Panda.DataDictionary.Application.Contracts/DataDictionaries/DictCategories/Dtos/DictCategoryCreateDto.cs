namespace Panda.DataDictionary.Application.Contracts.DataDictionaries.DictCategories.Dtos;

public class DictCategoryCreateDto : DictCategoryCreateOrUpdateDtoBase
{
    public Guid? ParnetId { get; set; }

    public string Key { get; set; } = default!;
}