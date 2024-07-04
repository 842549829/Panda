using Microsoft.AspNetCore.Mvc;
using Panda.DataDictionary.Application.Contracts.DataDictionaries.DictCategories;
using Panda.DataDictionary.Application.Contracts.DataDictionaries.DictCategories.Dtos;
using Volo.Abp.Application.Dtos;

namespace Panda.DataDictionary.HttpApi.Controllers.DataDictionaries;

[Route("api/dict/category")]
public class DictCategoryController(IDictCategoryAppService dictCategoryAppService) : DictionaryBaseController
{
    [HttpGet]
    public Task<PagedResultDto<DictCategoryDto>> GetListAsync(GetDictCategoryInput input)
    {
        return dictCategoryAppService.GetListAsync(input);
    }

    [HttpPost]
    public Task<DictCategoryDto> CreateAsync([FromBody] DictCategoryCreateDto input)
    {
        return dictCategoryAppService.CreateAsync(input);
    }

    [HttpPut]
    public Task<DictCategoryDto> UpdateAsync(Guid id, [FromBody] DictCategoryUpdateDto input)
    {
        return dictCategoryAppService.UpdateAsync(id, input);
    }

    [HttpDelete]
    public Task DeleteAsync(Guid id)
    {
        return dictCategoryAppService.DeleteAsync(id);
    }

    [HttpGet("{id}")]
    public Task<DictCategoryDto> GetAsync(Guid id)
    {
        return dictCategoryAppService.GetAsync(id);
    }
}