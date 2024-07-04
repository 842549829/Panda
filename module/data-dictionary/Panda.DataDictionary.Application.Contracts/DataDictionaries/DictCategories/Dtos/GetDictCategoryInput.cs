using Volo.Abp.Application.Dtos;

namespace Panda.DataDictionary.Application.Contracts.DataDictionaries.DictCategories.Dtos;

public class GetDictCategoryInput : PagedAndSortedResultRequestDto
{
    public string Filter { get; set; } = default!;
}