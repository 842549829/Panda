using System;
using Volo.Abp.Auditing;
using Volo.Abp.Domain.Entities.Auditing;
using Volo.Abp.MultiTenancy;

namespace Panda.Net.Bases.FileStores;

/// <summary>
/// 文件所需项目名称
/// </summary>
public class FileProjectName : FullAuditedAggregateRoot<Guid>, IMultiTenant, IHasEntityVersion
{
    /// <summary>
    ///文件所属项目名称
    /// </summary>
    public string ProjectName { get; set; }

    /// <summary>Id of the related tenant.</summary>
    public Guid? TenantId { get; set; }

    /// <summary>
    /// A version value that is increased whenever the entity is changed.
    /// </summary>
    public int EntityVersion { get; set; }
}