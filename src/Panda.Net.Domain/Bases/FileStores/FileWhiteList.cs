using System;
using Volo.Abp.Auditing;
using Volo.Abp.Domain.Entities.Auditing;
using Volo.Abp.MultiTenancy;

namespace Panda.Net.Bases.FileStores;

/// <summary>
/// 允许上传的文件白名单
/// </summary>
public class FileWhiteList : FullAuditedAggregateRoot<Guid>, IMultiTenant, IHasEntityVersion
{
    /// <summary>
    /// 文件扩展名
    /// </summary>
    public string Extension { get; set; }
    
    public Guid? TenantId { get; set; }

    public int EntityVersion { get; set; }
}