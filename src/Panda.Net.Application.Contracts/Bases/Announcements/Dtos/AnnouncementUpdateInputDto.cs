using System;

namespace Panda.Net.Bases.Announcements.Dtos;

/// <summary>
/// 数据模型:修改公告信息实体
/// </summary>
public class AnnouncementUpdateInputDto
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
    /// 发布类型{0:立即发送,1:指定时间发送}
    /// </summary>
    public int PublishType { get; set; }

    /// <summary>
    /// 公告内容
    /// </summary>
    public string Content { get; set; }
}