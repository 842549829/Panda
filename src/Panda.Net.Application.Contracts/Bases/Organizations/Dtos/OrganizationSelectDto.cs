using System;
using Volo.Abp.Application.Dtos;

namespace Panda.Net.Bases.Organizations.Dtos;

public class OrganizationSelectDto : EntityDto<Guid>
{
    public string Code { get; set; }

    public string DisplayName { get; set; }
    
    public virtual Guid? ParentId { get; set; }
}