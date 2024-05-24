using System;

namespace Panda.Net.Bases.Announcements.Dtos;

/// <summary>
/// 数据模型 公告列表查询
/// </summary>
public class AnnouncementListDto : AnnouncementDto
{
    /// <summary>
    /// 创建人名称
    /// </summary>
    public string CreatorName { get; set; }

    /// <summary>
    /// 创建时间
    /// </summary>
    public DateTime CreationTime { get; set; }
}