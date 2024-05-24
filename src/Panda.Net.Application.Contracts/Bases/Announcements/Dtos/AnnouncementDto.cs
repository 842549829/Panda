using System;
using Volo.Abp.Application.Dtos;

namespace Panda.Net.Bases.Announcements.Dtos;

/// <summary>
/// 数据模型:公告管理详细信息实体
/// </summary>
public class AnnouncementDto : EntityDto<Guid>
{
    /// <summary>
    /// 公告标题
    /// </summary>
    public string Title { get; set; }

    /// <summary>
    /// 发布时间
    /// </summary>
    public DateTime PublishTime { get; set; }

    /// <summary>
    /// 发布类型{0:已发送,1:待发送}
    /// </summary>
    public int PublishType { get; set; }

    /// <summary>
    /// 公告内容
    /// </summary>
    public string Content { get; set; }
}