using Panda.DataDictionary.Application.Contracts.DataDictionaries.DictCategories;
using Panda.DataDictionary.Application.Contracts.DataDictionaries.DictCategories.Dtos;
using Panda.DataDictionary.Domain.DataDictionaries.Entities;
using Panda.DataDictionary.Domain.DataDictionaries.Managers;
using Panda.Domain.Shared.Enums;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;
using Volo.Abp.Data;
using Volo.Abp.ObjectExtending;

namespace Panda.DataDictionary.Application.DataDictionaries;

public class DictCategoryAppService(IDictCategoryManager dictCategoryManager)
    : ApplicationService, IDictCategoryAppService
{
    public async Task<PagedResultDto<DictCategoryDto>> GetListAsync(GetDictCategoryInput input)
    {
        var list = await dictCategoryManager.GetListAsync(input.Sorting, input.MaxResultCount, input.SkipCount, input.Filter);
        var totalCount = await dictCategoryManager.GetCountAsync(input.Filter);

        return new PagedResultDto<DictCategoryDto>(
            totalCount,
            ObjectMapper.Map<List<DictCategory>, List<DictCategoryDto>>(list)
        );
    }

    public async Task<DictCategoryDto> CreateAsync(DictCategoryCreateDto input)
    {
        var dictCategory = new DictCategory(
            GuidGenerator.Create(),
            input.Key,
            input.Name,
            Enable.Enabled,
            input.Sort,
            input.Describe,
            input.Alias,
            string.Empty,
            input.ParnetId,
            CurrentUser.TenantId
        );

        input.MapExtraPropertiesTo(dictCategory);

        await dictCategoryManager.CreateAsync(dictCategory);

        await CurrentUnitOfWork?.SaveChangesAsync()!;

        return ObjectMapper.Map<DictCategory, DictCategoryDto>(dictCategory);
    }

    public async Task<DictCategoryDto> UpdateAsync(Guid id, DictCategoryUpdateDto input)
    {
        var dictCategory = await dictCategoryManager.GetAsync(id);

        dictCategory.SetConcurrencyStampIfNotNull(input.ConcurrencyStamp);

        dictCategory.Update(input.Name, input.Sort, input.Describe, input.Alias);
        dictCategory.ChangeStatus(input.Status);

        input.MapExtraPropertiesTo(dictCategory);

        await dictCategoryManager.UpdateAsync(dictCategory);

        await CurrentUnitOfWork?.SaveChangesAsync()!;

        return ObjectMapper.Map<DictCategory, DictCategoryDto>(dictCategory);
    }

    public Task DeleteAsync(Guid id)
    {
        return dictCategoryManager.DeleteAsync(id);
    }

    public async Task<DictCategoryDto> GetAsync(Guid id)
    {
        return ObjectMapper.Map<DictCategory, DictCategoryDto>(
            await dictCategoryManager.GetAsync(id)
        );
    }
}