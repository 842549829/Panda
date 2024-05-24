using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.TenantManagement;

namespace Panda.Net.Controllers.Bases;

[Route("api/basics/tenants")]
[ApiController]
public class TenantController : NetController
{
    private readonly ITenantAppService _tenantAppService;

    public TenantController(ITenantAppService tenantAppService)
    {
        _tenantAppService = tenantAppService;
    }

    [HttpGet]
    [Route("{id:guid}")]
    public virtual Task<TenantDto> GetAsync(Guid id)
    {
        return _tenantAppService.GetAsync(id);
    }

    [HttpGet]
    public virtual Task<PagedResultDto<TenantDto>> GetListAsync([FromQuery]GetTenantsInput input)
    {
        return _tenantAppService.GetListAsync(input);
    }

    [HttpPost]
    public virtual Task<TenantDto> CreateAsync(TenantCreateDto input)
    {
        ValidateModel();
        return _tenantAppService.CreateAsync(input);
    }

    [HttpPut]
    [Route("{id:guid}")]
    public virtual Task<TenantDto> UpdateAsync(Guid id, TenantUpdateDto input)
    {
        return _tenantAppService.UpdateAsync(id, input);
    }

    [HttpDelete]
    [Route("{id:guid}")]
    public virtual Task DeleteAsync(Guid id)
    {
        return _tenantAppService.DeleteAsync(id);
    }
}