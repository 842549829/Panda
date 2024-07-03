using Panda.Net.Bases.Announcements.Entities;
using System;
using Volo.Abp.Domain.Repositories;

namespace Panda.Net.Bases.Announcements.Repositories;

public interface IAnnouncementRepository : IRepository<Announcement, Guid>
{
}