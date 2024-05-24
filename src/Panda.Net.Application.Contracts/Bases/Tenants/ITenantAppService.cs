using System.Threading.Tasks;
using System;
using Volo.Abp.Application.Services;
using Volo.Abp.TenantManagement;
using Volo.Abp.Application.Dtos;

namespace Panda.Net.Bases.Tenants;

public interface ITenantAppService : IApplicationService
{
    Task<TenantDto> GetAsync(Guid id);

    Task<PagedResultDto<TenantDto>> GetListAsync(GetTenantsInput input);

    Task<TenantDto> CreateAsync(TenantCreateDto input);

    Task<TenantDto> UpdateAsync(Guid id, TenantUpdateDto input);

    Task DeleteAsync(Guid id);
}