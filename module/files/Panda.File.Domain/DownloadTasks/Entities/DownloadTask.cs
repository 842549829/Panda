using Volo.Abp.Auditing;
using Volo.Abp.Domain.Entities.Auditing;
using Volo.Abp.MultiTenancy;

namespace Panda.File.Domain.DownloadTasks.Entities;

/// <summary>
/// 下载任务
/// </summary>
public class DownloadTask : FullAuditedAggregateRoot<Guid>, IMultiTenant, IHasEntityVersion
{
    /// <summary>
    /// 租户Id
    /// </summary>
    public Guid? TenantId { get; set; }

    /// <summary>
    /// 一个版本值，每当实体发生更改时，该版本值就会增加
    /// </summary>
    public int EntityVersion { get; set; }

    /// <summary>
    /// 任务名称
    /// </summary>
    public string Name { get; set; } = default!;

    /// <summary>
    /// 任务描述
    /// </summary>
    public string Description { get; set; } = default!;

    /// <summary>
    /// 申请人Id
    /// </summary>
    public Guid ApplyId { get; set; }


}