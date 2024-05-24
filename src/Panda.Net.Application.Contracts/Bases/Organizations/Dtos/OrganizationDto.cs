using System;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Auditing;
using Volo.Abp.Domain.Entities;
using Volo.Abp.MultiTenancy;

namespace Panda.Net.Bases.Organizations.Dtos;

public class OrganizationDto : ExtensibleFullAuditedEntityDto<Guid>, IMultiTenant, IHasConcurrencyStamp, IHasEntityVersion
{
    public Guid? TenantId { get; set; }

    public string ConcurrencyStamp { get; set; }

    public int EntityVersion { get; set; }

    public virtual Guid? ParentId { get; set; }

    public virtual string Code { get; set; }

    public virtual string DisplayName { get; set; }
}