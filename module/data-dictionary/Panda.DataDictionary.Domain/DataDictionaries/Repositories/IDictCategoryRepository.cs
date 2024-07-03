using Panda.DataDictionary.Domain.DataDictionaries.Entities;
using Volo.Abp.Domain.Repositories;

namespace Panda.DataDictionary.Domain.DataDictionaries.Repositories;

public interface IDictCategoryRepository : IRepository<DictCategory, Guid>
{
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