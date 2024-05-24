using System.Collections.Generic;

namespace Panda.Net.Bases.Organizations.Dtos;

public class OrganizationTreeDto : OrganizationDto
{
    public bool? HasChildren { get; set; }

    public List<OrganizationTreeDto>? Children { get; set; }
}