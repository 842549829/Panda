namespace Panda.DataDictionary.Application.Contracts.DataDictionaries.DictCategories.Dtos;

public class DictItemCreateDto : DictItemCreateOrUpdateDtoBase
{
    public Guid? ParentId { get; set; }

    public string Key { get; set; } = default!;

    public string Value { get; set; } = default!;

    public Guid CategoryId { get; set; }
}