using Microsoft.EntityFrameworkCore;
using Panda.DataDictionary.Domain.DataDictionaries.Entities;
using Panda.DataDictionary.Domain.DataDictionaries.Repositories;
using Panda.DataDictionary.EntityFrameworkCore.DbContext;
using System.Linq.Dynamic.Core;
using Volo.Abp.Domain.Repositories.EntityFrameworkCore;
using Volo.Abp.EntityFrameworkCore;


namespace Panda.DataDictionary.EntityFrameworkCore.DataDictionaries;

public class DictCategoryRepository : EfCoreRepository<IDataDictionaryDbContext, DictCategory, Guid>,
    IDictCategoryRepository
{
    public DictCategoryRepository(IDbContextProvider<IDataDictionaryDbContext> dbContextProvider) : base(dbContextProvider)
    {
    }

    public async Task<List<DictCategory>> GetListAsync(string? sorting = null, int maxResultCount = int.MaxValue, int skipCount = 0, string? filter = null,
        bool includeDetails = false, CancellationToken cancellationToken = default)
    {
        return await (await GetDbSetAsync())
            .WhereIf(!filter.IsNullOrWhiteSpace(),
                x => x.Name.Contains(filter!))
            .OrderBy(sorting.IsNullOrWhiteSpace() ? nameof(DictCategory.LastModificationTime) : sorting)
            .PageBy(skipCount, maxResultCount)
            .ToListAsync(GetCancellationToken(cancellationToken));
    }

    public async Task<long> GetCountAsync(string? filter = null, CancellationToken cancellationToken = default)
    {
        return await(await GetDbSetAsync())
            .WhereIf(!filter.IsNullOrWhiteSpace(),
                x => x.Name.Contains(filter!))
            .LongCountAsync(GetCancellationToken(cancellationToken));
    }
}