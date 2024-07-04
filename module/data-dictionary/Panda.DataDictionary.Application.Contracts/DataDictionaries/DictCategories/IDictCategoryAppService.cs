using Panda.DataDictionary.Application.Contracts.DataDictionaries.DictCategories.Dtos;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Panda.DataDictionary.Application.Contracts.DataDictionaries.DictCategories;

public interface IDictCategoryAppService : IApplicationService
{
    Task<PagedResultDto<DictCategoryDto>> GetListAsync(GetDictCategoryInput input);

    Task<DictCategoryDto> CreateAsync(DictCategoryCreateDto input);

    Task<DictCategoryDto> UpdateAsync(Guid id, DictCategoryUpdateDto input);

    Task DeleteAsync(Guid id);

    Task<DictCategoryDto> GetAsync(Guid id);
}