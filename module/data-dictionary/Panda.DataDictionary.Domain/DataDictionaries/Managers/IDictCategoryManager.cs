using Panda.DataDictionary.Domain.DataDictionaries.Entities;
using Volo.Abp.Domain.Services;

namespace Panda.DataDictionary.Domain.DataDictionaries.Managers;

public interface IDictCategoryManager : IDomainService
{
    Task<DictCategory> CreateAsync(DictCategory dictCategory, CancellationToken cancellationToken = default);

    Task<DictCategory> UpdateAsync(DictCategory dictCategory, CancellationToken cancellationToken = default);

    Task DeleteAsync(Guid id, CancellationToken cancellationToken = default);

    Task<DictCategory> GetAsync(Guid id, CancellationToken cancellationToken = default);

    Task<List<DictCategory>> GetListAsync(string? sorting = null,
        int maxResultCount = int.MaxValue,
        int skipCount = 0,
        string? filter = null,
        bool includeDetails = false,
        CancellationToken cancellationToken = default);

    Task<long> GetCountAsync(
        string? filter = null,
        CancellationToken cancellationToken = default
    );
}