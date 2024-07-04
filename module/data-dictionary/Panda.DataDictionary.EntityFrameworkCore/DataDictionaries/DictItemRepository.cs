using Microsoft.EntityFrameworkCore;
using Panda.DataDictionary.Domain.DataDictionaries.Entities;
using Panda.DataDictionary.Domain.DataDictionaries.Repositories;
using Panda.DataDictionary.EntityFrameworkCore.DbContext;
using System.Linq.Dynamic.Core;
using Volo.Abp.Domain.Repositories.EntityFrameworkCore;
using Volo.Abp.EntityFrameworkCore;

namespace Panda.DataDictionary.EntityFrameworkCore.DataDictionaries;

public class DictItemRepository : EfCoreRepository<IDataDictionaryDbContext, DictItem, Guid>,
    IDictItemRepository
{
    public DictItemRepository(IDbContextProvider<IDataDictionaryDbContext> dbContextProvider) : base(dbContextProvider)
    {
    }

    public async Task<List<DictItem>> GetListAsync(Guid categoryId, string? sorting = null, int maxResultCount = Int32.MaxValue, int skipCount = 0,
        string? filter = null, bool includeDetails = false, CancellationToken cancellationToken = default)
    {
        return await (await GetDbSetAsync())
            .Where(a => a.CategoryId == categoryId)
            .WhereIf(!filter.IsNullOrWhiteSpace(),
                x => x.Name.Contains(filter!))
            .OrderBy(sorting.IsNullOrWhiteSpace() ? nameof(DictItem.LastModificationTime) : sorting)
            .PageBy(skipCount, maxResultCount)
            .ToListAsync(GetCancellationToken(cancellationToken));
    }

    public async Task<long> GetCountAsync(Guid categoryId, string? filter = null, CancellationToken cancellationToken = default)
    {
        return await (await GetDbSetAsync())
            .Where(a => a.CategoryId == categoryId)
            .WhereIf(!filter.IsNullOrWhiteSpace(),
                x => x.Name.Contains(filter!))
            .LongCountAsync(GetCancellationToken(cancellationToken));
    }
}