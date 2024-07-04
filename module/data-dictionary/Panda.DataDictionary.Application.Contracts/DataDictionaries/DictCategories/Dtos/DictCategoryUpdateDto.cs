using Panda.Domain.Shared.Enums;
using Volo.Abp.Domain.Entities;

namespace Panda.DataDictionary.Application.Contracts.DataDictionaries.DictCategories.Dtos;

public class DictCategoryUpdateDto : DictCategoryCreateOrUpdateDtoBase, IHasConcurrencyStamp
{
    public string ConcurrencyStamp { get; set; } = default!;

    public Enable Status { get; set; }
}