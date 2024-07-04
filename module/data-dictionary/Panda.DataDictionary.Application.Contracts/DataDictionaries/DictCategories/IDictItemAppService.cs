using Panda.DataDictionary.Application.Contracts.DataDictionaries.DictCategories.Dtos;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Panda.DataDictionary.Application.Contracts.DataDictionaries.DictCategories;

public interface IDictItemAppService : IApplicationService
{
    Task<PagedResultDto<DictItemDto>> GetListAsync(GetDictItemInput input);

    Task<DictItemDto> CreateAsync(DictItemCreateDto input);

    Task<DictItemDto> UpdateAsync(Guid id, DictItemUpdateDto input);

    Task DeleteAsync(Guid id);

    Task<DictItemDto> GetAsync(Guid id);
}