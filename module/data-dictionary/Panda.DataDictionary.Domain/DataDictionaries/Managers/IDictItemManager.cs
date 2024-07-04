using Panda.DataDictionary.Domain.DataDictionaries.Entities;
using Volo.Abp.Domain.Services;

namespace Panda.DataDictionary.Domain.DataDictionaries.Managers;

public interface IDictItemManager : IDomainService
{
    Task<DictItem> CreateAsync(DictItem dictCategory, CancellationToken cancellationToken = default);

    Task<DictItem> UpdateAsync(DictItem dictCategory, CancellationToken cancellationToken = default);

    Task DeleteAsync(Guid id, CancellationToken cancellationToken = default);

    Task<DictItem> GetAsync(Guid id, CancellationToken cancellationToken = default);

    Task<List<DictItem>> GetListAsync(Guid categoryId, string? sorting = null,
        int maxResultCount = int.MaxValue,
        int skipCount = 0,
        string? filter = null,
        bool includeDetails = false,
        CancellationToken cancellationToken = default);

    Task<long> GetCountAsync(
        Guid categoryId,
        string? filter = null,
        CancellationToken cancellationToken = default
    );
}