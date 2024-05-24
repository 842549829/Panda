using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using Volo.Abp.Identity;

namespace Panda.Net.Bases.Organizations.Repositories;

public interface IOrganizationRepository : IOrganizationUnitRepository
{
    Task<long> GetCountAsync(string? filter = null,
        Guid? parentId = null,
        CancellationToken cancellationToken = default);

    Task<List<OrganizationUnit>> GetListAsync(
        string sorting,
        string? filter = null,
        Guid? parentId = null,
        int maxResultCount = int.MaxValue,
        int skipCount = 0,
        bool includeDetails = false,
        CancellationToken cancellationToken = default);
}