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

public class DictItemAppService(IDictItemManager dictItemManager)
    : ApplicationService, IDictItemAppService
{
    public async Task<PagedResultDto<DictItemDto>> GetListAsync(GetDictItemInput input)
    {
        var list = await dictItemManager.GetListAsync(input.CategoryId, input.Sorting, input.MaxResultCount, input.SkipCount, input.Filter);
        var totalCount = await dictItemManager.GetCountAsync(input.CategoryId, input.Filter);

        return new PagedResultDto<DictItemDto>(
            totalCount,
            ObjectMapper.Map<List<DictItem>, List<DictItemDto>>(list)
        );
    }

    public async Task<DictItemDto> CreateAsync(DictItemCreateDto input)
    {
        var dictItem = new DictItem(
            GuidGenerator.Create(),
            input.CategoryId,
            input.Key,
            input.Value,
            input.Name,
            Enable.Enabled,
            input.Sort,
            input.Describe,
            input.Style ?? string.Empty,
            string.Empty,
            input.ParnetId,
            CurrentUser.TenantId
        );

        input.MapExtraPropertiesTo(dictItem);

        await dictItemManager.CreateAsync(dictItem);

        await CurrentUnitOfWork?.SaveChangesAsync()!;

        return ObjectMapper.Map<DictItem, DictItemDto>(dictItem);
    }

    public async Task<DictItemDto> UpdateAsync(Guid id, DictItemUpdateDto input)
    {
        var dictItem = await dictItemManager.GetAsync(id);

        dictItem.SetConcurrencyStampIfNotNull(input.ConcurrencyStamp);

        dictItem.Update(input.Name, input.Sort, input.Describe, input.Style ?? string.Empty);
        dictItem.ChangeStatus(input.Status);

        input.MapExtraPropertiesTo(dictItem);

        await dictItemManager.UpdateAsync(dictItem);

        await CurrentUnitOfWork?.SaveChangesAsync()!;

        return ObjectMapper.Map<DictItem, DictItemDto>(dictItem);
    }

    public async Task DeleteAsync(Guid id)
    {
        await dictItemManager.DeleteAsync(id);
    }

    public async Task<DictItemDto> GetAsync(Guid id)
    {
        return ObjectMapper.Map<DictItem, DictItemDto>(
            await dictItemManager.GetAsync(id)
        );
    }
}