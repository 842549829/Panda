using Microsoft.AspNetCore.Mvc;
using Panda.DataDictionary.Application.Contracts.DataDictionaries.DictCategories;
using Panda.DataDictionary.Application.Contracts.DataDictionaries.DictCategories.Dtos;
using Volo.Abp.Application.Dtos;

namespace Panda.DataDictionary.HttpApi.Controllers.DataDictionaries;

[Route("api/dict/item")]
public class DictItemController(IDictItemAppService dictItemAppService) : DictionaryBaseController
{
    [HttpGet]
    public Task<PagedResultDto<DictItemDto>> GetListAsync(GetDictItemInput input)
    {
        return dictItemAppService.GetListAsync(input);
    }

    [HttpPost]
    public Task<DictItemDto> CreateAsync([FromBody] DictItemCreateDto input)
    {
        return dictItemAppService.CreateAsync(input);
    }

    [HttpPut]
    public Task<DictItemDto> UpdateAsync(Guid id, [FromBody] DictItemUpdateDto input)
    {
        return dictItemAppService.UpdateAsync(id, input);
    }

    [HttpDelete]
    public Task DeleteAsync(Guid id)
    {
        return dictItemAppService.DeleteAsync(id);
    }

    [HttpGet("{id}")]
    public Task<DictItemDto> GetAsync(Guid id)
    {
        return dictItemAppService.GetAsync(id);
    }
}