using Dapper;
using Panda.Net.Bases.Organizations.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Volo.Abp.Domain.Repositories.Dapper;
using Volo.Abp.EntityFrameworkCore;
using Volo.Abp.Identity;
using Volo.Abp.Identity.EntityFrameworkCore;
using Volo.Abp.Users;

namespace Panda.Net.Bases.Organizations;

public class OrganizationDapperRepository : DapperRepository<IIdentityDbContext>, IOrganizationDapperRepository
{
    protected ICurrentUser CurrentUser => LazyServiceProvider.LazyGetRequiredService<ICurrentUser>();

    public OrganizationDapperRepository(IDbContextProvider<IIdentityDbContext> dbContextProvider) : base(
        dbContextProvider)
    {
    }

    public async Task<long> GetCountAsync(string? filter = null, Guid? parentId = null,
        CancellationToken cancellationToken = default)
    {
        var connection = await GetDbConnectionAsync();
        var transaction = await GetDbTransactionAsync();

        if (filter != null || parentId.HasValue)
        {
            var queryParams = new DynamicParameters();
            var sqlCondition = new StringBuilder();
            sqlCondition.Append(" WHERE fun.IsDeleted = 0 ");
            SetTenantIdParams(sqlCondition, queryParams, "fun.");
            if (parentId.HasValue)
            {
                queryParams.Add("parentId", parentId);
                sqlCondition.Append(" AND fun.ParentId = @parentId ");
            }

            if (!string.IsNullOrWhiteSpace(filter))
            {
                queryParams.Add("filter", $"%{filter}%");
                sqlCondition.Append(" AND fun.DisplayName LIKE @filter ");
            }

            var sql = $"""
                       WITH RECURSIVE _parent AS
                       (
                        SELECT fun.* FROM `abporganizationunits` fun {sqlCondition}
                           UNION ALL
                        SELECT fun.* FROM _parent,`abporganizationunits` fun WHERE fun.IsDeleted = 0 AND fun.Id=_parent.ParentId
                       )
                       SELECT COUNT(*) FROM (
                       SELECT COUNT(*) FROM _parent WHERE _parent.ParentId IS NULL GROUP BY _parent.Id) AS T;
                       """;

            return await connection.QueryFirstOrDefaultAsync<long>(sql, new { filter = $"%{filter}%", parentId },
                transaction);
        }
        else
        {
            var queryParams = new DynamicParameters();
            var sqlCondition = new StringBuilder();
            SetTenantIdParams(sqlCondition, queryParams);
            var sql = $"SELECT COUNT(*) FROM `abporganizationunits` WHERE IsDeleted = 0 {sqlCondition} AND ParentId IS NULL";
            return await connection.QueryFirstOrDefaultAsync<long>(sql, queryParams, transaction);
        }
    }

    public async Task<List<OrganizationUnit>> GetListAsync(string sorting, string? filter = null, Guid? parentId = null,
        int maxResultCount = int.MaxValue,
        int skipCount = 0, bool includeDetails = false, CancellationToken cancellationToken = default)
    {
        var connection = await GetDbConnectionAsync();
        var transaction = await GetDbTransactionAsync();

        var queryParams = new DynamicParameters();
        queryParams.Add("skipCount", skipCount);
        queryParams.Add("maxResultCount", maxResultCount);

        if (filter != null || parentId.HasValue)
        {
            var sqlCondition = new StringBuilder();
            sqlCondition.Append(" WHERE fun.IsDeleted = 0 ");
            SetTenantIdParams(sqlCondition, queryParams, "fun.");
            if (parentId.HasValue)
            {
                queryParams.Add("parentId", parentId);
                sqlCondition.Append(" AND fun.ParentId = @parentId ");
            }

            if (!string.IsNullOrWhiteSpace(filter))
            {
                queryParams.Add("filter", $"%{filter}%");
                sqlCondition.Append(" AND fun.DisplayName LIKE @filter ");
            }

            var sql = $"""
                       WITH RECURSIVE _parent AS
                       (
                        SELECT fun.* FROM `abporganizationunits` fun {sqlCondition}
                           UNION ALL
                        SELECT fun.* FROM _parent,`abporganizationunits` fun WHERE fun.IsDeleted = 0 AND fun.Id=_parent.ParentId
                       )
                       SELECT DISTINCT * FROM _parent WHERE _parent.ParentId IS NULL ORDER BY `Code` LIMIT @skipCount, @maxResultCount;
                       """;
            return (await connection.QueryAsync<OrganizationUnit>(sql,
                queryParams, transaction)).ToList();
        }
        else
        {
            var sqlCondition = new StringBuilder();
            SetTenantIdParams(sqlCondition, queryParams);
            var sql =
                $"SELECT * FROM `abporganizationunits` WHERE IsDeleted = 0 {sqlCondition} AND ParentId IS NULL ORDER BY `Code` LIMIT @skipCount, @maxResultCount";
            return (await connection.QueryAsync<OrganizationUnit>(sql, queryParams, transaction)).ToList();
        }
    }

    public async Task<List<OrganizationWithChildCount>> GetOrganizationUnitsWithChildCountAsync(List<Guid> parentIds,
        CancellationToken cancellationToken = default)
    {
        var queryParams = new DynamicParameters();
        queryParams.Add("parentIds", parentIds);
        var sqlCondition = new StringBuilder();
        SetTenantIdParams(sqlCondition, queryParams);
        var sql =
            $"SELECT ParentId AS `Id`, COUNT(0) AS `Count` FROM abporganizationunits WHERE IsDeleted = 0 {sqlCondition} AND ParentId IN @parentIds GROUP BY ParentId";
        var connection = await GetDbConnectionAsync();
        var transaction = await GetDbTransactionAsync();
        return (await connection.QueryAsync<OrganizationWithChildCount>(sql, queryParams,
            transaction)).ToList();
    }

    private void SetTenantIdParams(StringBuilder sqlCondition, DynamicParameters queryParams, string alias = "")
    {
        if (CurrentUser.TenantId.HasValue)
        {
            sqlCondition.Append($" AND {alias}TenantId = @tenantId ");
            queryParams.Add("tenantId", CurrentUser.TenantId.Value);
        }
        else
        {
            sqlCondition.Append($" AND {alias}TenantId IS NULL");
        }
    }
}