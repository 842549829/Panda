using Panda.DataDictionary.Domain.DataDictionaries.Entities;
using Panda.DataDictionary.Domain.DataDictionaries.Repositories;
using Volo.Abp.Domain.Services;

namespace Panda.DataDictionary.Domain.DataDictionaries.Managers;

public class DictItemManager(IDictItemRepository dictItemRepository) : DomainService, IDictItemManager
{
    public Task<DictItem> CreateAsync(DictItem dictCategory, CancellationToken cancellationToken = default)
    {
        return dictItemRepository.InsertAsync(dictCategory, cancellationToken: cancellationToken);
    }

    public Task<DictItem> UpdateAsync(DictItem dictCategory, CancellationToken cancellationToken = default)
    {
        return dictItemRepository.UpdateAsync(dictCategory, cancellationToken: cancellationToken);
    }

    public Task DeleteAsync(Guid id, CancellationToken cancellationToken = default)
    {
        return dictItemRepository.DeleteAsync(id, cancellationToken: cancellationToken);
    }

    public Task<DictItem> GetAsync(Guid id, CancellationToken cancellationToken = default)
    {
        return dictItemRepository.GetAsync(id, cancellationToken: cancellationToken);
    }

    public Task<List<DictItem>> GetListAsync(Guid categoryId, string? sorting = null, int maxResultCount = Int32.MaxValue, int skipCount = 0,
        string? filter = null, bool includeDetails = false, CancellationToken cancellationToken = default)
    {
        return dictItemRepository.GetListAsync(categoryId, sorting, maxResultCount, skipCount, filter, includeDetails, cancellationToken);
    }

    public Task<long> GetCountAsync(Guid categoryId, string? filter = null, CancellationToken cancellationToken = default)
    {
        return dictItemRepository.GetCountAsync(categoryId, filter, cancellationToken);
    }
}