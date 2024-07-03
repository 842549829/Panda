using Microsoft.EntityFrameworkCore;
using Panda.Net.Bases.Organizations.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Dynamic.Core;
using System.Threading;
using System.Threading.Tasks;
using Volo.Abp.EntityFrameworkCore;
using Volo.Abp.Identity;
using Volo.Abp.Identity.EntityFrameworkCore;

namespace Panda.Net.Bases.Organizations;

public class OrganizationRepository : EfCoreOrganizationUnitRepository, IOrganizationRepository
{
    public OrganizationRepository(IDbContextProvider<IIdentityDbContext> dbContextProvider) : base(dbContextProvider)
    {
    }

    public async Task<long> GetCountAsync(string? filter = null,
        Guid? parentId = null,
        CancellationToken cancellationToken = default)
    {
        return await (await GetDbSetAsync())
            .WhereIf(!filter.IsNullOrWhiteSpace(), u => u.DisplayName.Contains(filter!))
            .WhereIf(parentId.HasValue, u => u.ParentId == parentId)
            .LongCountAsync(GetCancellationToken(cancellationToken));
    }

    public async Task<List<OrganizationUnit>> GetListAsync(
        string sorting,
        string? filter = null,
        Guid? parentId = null,
        int maxResultCount = int.MaxValue,
        int skipCount = 0,
        bool includeDetails = false, CancellationToken cancellationToken = default) => await (await GetDbSetAsync())
        .IncludeDetails(includeDetails)
        .WhereIf(!filter.IsNullOrWhiteSpace(), u => u.DisplayName.Contains(filter!))
        .WhereIf(parentId.HasValue, u => u.ParentId == parentId)
        .OrderBy(sorting)
        .PageBy(skipCount, maxResultCount)
        .ToListAsync(GetCancellationToken(cancellationToken));


    public async Task<List<OrganizationUnit>> GetList1Async(
        string sorting,
        string? filter = null,
        Guid? parentId = null,
        int maxResultCount = int.MaxValue,
        int skipCount = 0,
        bool includeDetails = false, CancellationToken cancellationToken = default)
    {
        return await (await GetDbSetAsync())
            .IncludeDetails(includeDetails)
            .WhereIf(!filter.IsNullOrWhiteSpace(), u => u.DisplayName.Contains(filter!))
            .WhereIf(parentId.HasValue, u => u.ParentId == parentId)
            .OrderBy(sorting)
            .OrderBy(o => o.Code == "Status5Value" ? "0"
                : o.Code == "Status2Value" ? "1"
                : o.Code == "Status4Value" ? "2"
                : o.Code == "Status3Value" ? "3"
                : o.Code == "Status1Value" ? "4"
                : o.Code == "Status7Value" ? "5"
                : "6") // 用于处理其他未知状态值)
            .PageBy(skipCount, maxResultCount)
            .ToListAsync(GetCancellationToken(cancellationToken));
    }
}