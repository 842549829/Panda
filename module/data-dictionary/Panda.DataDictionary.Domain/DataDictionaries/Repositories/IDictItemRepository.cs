using Panda.DataDictionary.Domain.DataDictionaries.Entities;
using Volo.Abp.Domain.Repositories;

namespace Panda.DataDictionary.Domain.DataDictionaries.Repositories;

public interface IDictItemRepository : IRepository<DictItem, Guid>
{
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