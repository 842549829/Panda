using Volo.Abp.Application.Dtos;

namespace Panda.DataDictionary.Application.Contracts.DataDictionaries.DictCategories.Dtos;

public class GetDictItemInput : PagedAndSortedResultRequestDto
{
    public Guid CategoryId { get; set; }

    public string? Filter { get; set; }
}