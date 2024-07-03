using System;
using Volo.Abp.Application.Dtos;

namespace Panda.Net.Bases.Organizations.Dtos;

public class GetOrganizationsInput : PagedAndSortedResultRequestDto
{
    public override string Sorting { get; set; } = nameof(OrganizationDto.Code);

    public Guid? ParentId { get; set; }
    
    public string? Filter { get; set; }
}