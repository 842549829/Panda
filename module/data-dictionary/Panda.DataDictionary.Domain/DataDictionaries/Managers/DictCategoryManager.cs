using Panda.DataDictionary.Domain.DataDictionaries.Entities;
using Panda.DataDictionary.Domain.DataDictionaries.Repositories;
using Volo.Abp.Domain.Services;

namespace Panda.DataDictionary.Domain.DataDictionaries.Managers;

public class DictCategoryManager(IDictCategoryRepository dictCategoryRepository) : DomainService, IDictCategoryManager
{
    public Task<DictCategory> CreateAsync(DictCategory dictCategory, CancellationToken cancellationToken = default)
    {
        return dictCategoryRepository.InsertAsync(dictCategory, cancellationToken: cancellationToken);
    }

    public Task<DictCategory> UpdateAsync(DictCategory dictCategory, CancellationToken cancellationToken = default)
    {
        return dictCategoryRepository.UpdateAsync(dictCategory, cancellationToken: cancellationToken);
    }

    public Task DeleteAsync(Guid id, CancellationToken cancellationToken = default)
    {
        return dictCategoryRepository.DeleteAsync(id, cancellationToken: cancellationToken);
    }

    public Task<DictCategory> GetAsync(Guid id, CancellationToken cancellationToken = default)
    {
        return dictCategoryRepository.GetAsync(id, cancellationToken: cancellationToken);
    }

    public Task<List<DictCategory>> GetListAsync(string? sorting = null, int maxResultCount = int.MaxValue, int skipCount = 0, string? filter = null,
        bool includeDetails = false, CancellationToken cancellationToken = default)
    {
        return dictCategoryRepository.GetListAsync(sorting, maxResultCount, skipCount, filter, includeDetails, cancellationToken);
    }

    public Task<long> GetCountAsync(string? filter = null, CancellationToken cancellationToken = default)
    {
        return dictCategoryRepository.GetCountAsync(filter, cancellationToken);
    }
}