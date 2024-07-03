using Panda.Net.Bases.Announcements.Dtos;
using System;
using Volo.Abp.Application.Services;

namespace Panda.Net.Bases.Announcements;

public interface IAnnouncementAppService : ICrudAppService<AnnouncementDto,
    AnnouncementListDto,
    Guid,
    AnnouncementGetListInputDto,
    AnnouncementCreateInputDto,
    AnnouncementUpdateInputDto>
{
}