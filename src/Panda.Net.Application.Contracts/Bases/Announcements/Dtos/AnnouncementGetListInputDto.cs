using Panda.Net.Enums;
using Volo.Abp.Application.Dtos;

namespace Panda.Net.Bases.Announcements.Dtos;

/// <summary>
/// 数据模型: 公告管理分页查询条件实体
/// </summary>
public class AnnouncementGetListInputDto : PagedAndSortedResultRequestDto
{
    /// <summary>
    /// 公告标题
    /// </summary>
    public string? Title { get; set; }

    /// <summary>
    /// 发布类型{0:已发送,1:待发送}
    /// </summary>
    public PublishType? PublishType { get; set; }
}