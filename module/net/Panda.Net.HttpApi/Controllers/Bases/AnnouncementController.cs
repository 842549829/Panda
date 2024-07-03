using Microsoft.AspNetCore.Mvc;
using Panda.Net.Bases.Announcements;
using Panda.Net.Bases.Announcements.Dtos;
using System;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;

namespace Panda.Net.Controllers.Bases;

/// <summary>
/// 公告管理
/// </summary>
[ApiController]
[Route("api/basics/announcement")]
public class AnnouncementController : NetController
{
    private readonly IAnnouncementAppService _announcementAppService;

    public AnnouncementController(IAnnouncementAppService announcementAppService)
    {
        _announcementAppService = announcementAppService;
    }

    /// <summary>
    /// 新增公告
    /// </summary>
    /// <param name="input">新增信息</param>
    /// <returns>新增结果</returns>
    [HttpPost]
    public async Task<AnnouncementDto> CreateAsync([FromBody] AnnouncementCreateInputDto input)
    {
        return await _announcementAppService.CreateAsync(input);
    }

    /// <summary>
    /// 修改公告
    /// </summary>
    /// <param name="id">公告Id</param>
    /// <param name="input">修改信息</param>
    /// <returns>修改结果</returns>
    [HttpPut("{id:guid}")]
    public async Task<AnnouncementDto> UpdateAsync(Guid id,
        [FromBody] AnnouncementUpdateInputDto input)
    {
        return await _announcementAppService.UpdateAsync(id, input);
    }

    /// <summary>
    /// 查询公告
    /// </summary>
    /// <param name="id">公告Id</param>
    /// <returns>公告信息</returns>
    [HttpGet("{id:guid}")]
    public async Task<AnnouncementDto> GetAsync(Guid id)
    {
        return await _announcementAppService.GetAsync(id);
    }

    /// <summary>
    /// 删除公告
    /// </summary>
    /// <param name="id">公告Id</param>
    /// <returns>删除信息</returns>
    [HttpDelete("{id:guid}")]
    public async Task<bool> DeleteAsync(Guid id)
    {
        await _announcementAppService.DeleteAsync(id);
        return true;
    }

    /// <summary>
    /// 分页查询
    /// </summary>
    /// <param name="input">查询条件</param>
    /// <returns>查询结果</returns>
    [HttpGet("list")]
    public async Task<PagedResultDto<AnnouncementListDto>> GetListAsync([FromQuery] AnnouncementGetListInputDto input)
    {
        return await _announcementAppService.GetListAsync(input);
    }
}