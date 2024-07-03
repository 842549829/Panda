using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Data;
using Volo.Abp.EventBus.Distributed;
using Volo.Abp.MultiTenancy;
using Volo.Abp.ObjectExtending;
using Volo.Abp.TenantManagement;

namespace Panda.Net.Bases.Tenants;

public class TenantAppService : NetAppService, ITenantAppService
{
    private readonly ITenantManager _tenantManager;
    private readonly ITenantRepository _tenantRepository;
    private readonly IDistributedEventBus _distributedEventBus;
    private readonly IDataSeeder _dataSeeder;

    public TenantAppService(ITenantManager tenantManager,
        ITenantRepository tenantRepository,
        IDistributedEventBus distributedEventBus,
        IDataSeeder dataSeeder)
    {
        _tenantManager = tenantManager;
        _tenantRepository = tenantRepository;
        _distributedEventBus = distributedEventBus;
        _dataSeeder = dataSeeder;
    }

    [RemoteService(IsEnabled = false)]
    public async Task<TenantDto> GetAsync(Guid id)
    {
        return ObjectMapper.Map<Tenant, TenantDto>(
            await _tenantRepository.GetAsync(id)
        );
    }

    [RemoteService(IsEnabled = false)]
    public async Task<PagedResultDto<TenantDto>> GetListAsync(GetTenantsInput input)
    {
        if (input.Sorting.IsNullOrWhiteSpace())
        {
            input.Sorting = nameof(Tenant.Name);
        }

        var count = await _tenantRepository.GetCountAsync(input.Filter);
        var list = await _tenantRepository.GetListAsync(
            input.Sorting,
            input.MaxResultCount,
            input.SkipCount,
            input.Filter
        );

        return new PagedResultDto<TenantDto>(
            count,
            ObjectMapper.Map<List<Tenant>, List<TenantDto>>(list)
        );
    }

    [RemoteService(IsEnabled = false)]
    public async Task<TenantDto> CreateAsync(TenantCreateDto input)
    {
        var tenant = await _tenantManager.CreateAsync(input.Name);
        input.MapExtraPropertiesTo(tenant);

        await _tenantRepository.InsertAsync(tenant);

        await CurrentUnitOfWork?.SaveChangesAsync()!;

        await _distributedEventBus.PublishAsync(
            new TenantCreatedEto
            {
                Id = tenant.Id,
                Name = tenant.Name,
                Properties =
                {
                    { "AdminEmail", input.AdminEmailAddress },
                    { "AdminPassword", input.AdminPassword }
                }
            });

        using (CurrentTenant.Change(tenant.Id, tenant.Name))
        {
            await _dataSeeder.SeedAsync(
                new DataSeedContext(tenant.Id)
                    .WithProperty("AdminEmail", input.AdminEmailAddress)
                    .WithProperty("AdminPassword", input.AdminPassword)
            );
        }

        return ObjectMapper.Map<Tenant, TenantDto>(tenant);
    }

    [RemoteService(IsEnabled = false)]
    public async Task<TenantDto> UpdateAsync(Guid id, TenantUpdateDto input)
    {
        var tenant = await _tenantRepository.GetAsync(id);

        await _tenantManager.ChangeNameAsync(tenant, input.Name);

        tenant.SetConcurrencyStampIfNotNull(input.ConcurrencyStamp);
        input.MapExtraPropertiesTo(tenant);

        await _tenantRepository.UpdateAsync(tenant);

        return ObjectMapper.Map<Tenant, TenantDto>(tenant);
    }

    [RemoteService(IsEnabled = false)]
    public async Task DeleteAsync(Guid id)
    {
        var tenant = await _tenantRepository.FindAsync(id);
        if (tenant == null)
        {
            return;
        }

        await _tenantRepository.DeleteAsync(tenant);
    }
}