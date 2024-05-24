using Panda.Net.Bases.Organizations.Dtos;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace Panda.Net.Bases.Organizations;

public interface IOrganizationAppService : IApplicationService
{
    Task<OrganizationDto> CreateAsync(OrganizationCreateDto input);

    Task<OrganizationDto> UpdateAsync(Guid id, OrganizationUpdateDto input);

    Task<OrganizationDto> GetAsync(Guid id);

    Task<PagedResultDto<OrganizationTreeDto>> GetListAsync(GetOrganizationsInput input);

    Task<List<OrganizationDto>> GetSelectAsync(Guid? parentId, bool recursive = false);

    Task<List<OrganizationTreeDto>> GetTreeAsync(Guid? parentId);
    
    Task DeleteAsync(Guid id);
}