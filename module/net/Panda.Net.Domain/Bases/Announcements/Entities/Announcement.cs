using Panda.DataPermission.Abstractions.DataPermission;
using Panda.Net.Enums;
using System;
using Volo.Abp.Auditing;
using Volo.Abp.Domain.Entities.Auditing;
using Volo.Abp.MultiTenancy;

namespace Panda.Net.Bases.Announcements.Entities;

public class Announcement : FullAuditedAggregateRoot<Guid>, IMultiTenant, IHasEntityVersion, IDataPermission
{
    /// <summary>Id of the related tenant.</summary>
    public Guid? TenantId { get; }

    /// <summary>
    /// A version value that is increased whenever the entity is changed.
    /// </summary>
    public int EntityVersion { get; }

    /// <summary>
    /// 公告标题
    /// </summary>
    public string Title { get; set; }

    /// <summary>
    /// 发布时间
    /// </summary>
    public DateTime PublishTime { get; set; }

    /// <summary>
    /// 发布类型{0:立即发送,1:指定时间发送}
    /// </summary>
    public PublishType PublishType { get; set; }

    /// <summary>
    /// 公告内容
    /// </summary>
    public string Content { get; set; }

    /// <summary>
    /// Hierarchical Code of this organization unit.
    /// Example: "00001.00042.00005".
    /// This is a unique code for an OrganizationUnit.
    /// It's changeable if OU hierarchy is changed.
    /// </summary>
    public string Code { get; set; }
}