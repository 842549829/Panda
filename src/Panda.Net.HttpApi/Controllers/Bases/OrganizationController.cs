using Microsoft.AspNetCore.Mvc;
using Panda.Net.Bases.Organizations;
using Panda.Net.Bases.Organizations.Dtos;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;

namespace Panda.Net.Controllers.Bases;

[Route("api/basics/organizations")]
[ApiController]
public class OrganizationController : NetController
{
    private readonly IOrganizationAppService _organizationAppService;

    public OrganizationController(IOrganizationAppService organizationAppService)
    {
        _organizationAppService = organizationAppService;
    }

    [HttpGet]
    public Task<PagedResultDto<OrganizationTreeDto>> GetListAsync([FromQuery] GetOrganizationsInput input)
    {
        return _organizationAppService.GetListAsync(input);
    }

    [HttpGet]
    [Route("{id:guid}")]
    public virtual Task<OrganizationDto> GetAsync(Guid id)
    {
        return _organizationAppService.GetAsync(id);
    }

    [HttpGet("select")]
    public virtual Task<List<OrganizationDto>> GetSelectAsync([FromQuery] Guid? parentId,
        [FromQuery] bool recursive = false)
    {
        return _organizationAppService.GetSelectAsync(parentId, recursive);
    }

    [HttpGet("tree")]
    public Task<List<OrganizationTreeDto>> GetTreeAsync([FromQuery] Guid? parentId)
    {
        return _organizationAppService.GetTreeAsync(parentId);
    }

    [HttpPost]
    public virtual Task<OrganizationDto> CreateAsync(OrganizationCreateDto input)
    {
        ValidateModel();
        return _organizationAppService.CreateAsync(input);
    }

    [HttpPut]
    [Route("{id:guid}")]
    public virtual Task<OrganizationDto> UpdateAsync(Guid id, OrganizationUpdateDto input)
    {
        return _organizationAppService.UpdateAsync(id, input);
    }
    
    [HttpDelete]
    [Route("{id:guid}")]
    public Task DeleteAsync(Guid id)
    {
        return _organizationAppService.DeleteAsync(id);
    }
}