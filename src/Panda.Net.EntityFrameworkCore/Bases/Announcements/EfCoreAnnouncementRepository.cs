using Panda.Net.Bases.Announcements.Entities;
using Panda.Net.Bases.Announcements.Repositories;
using Panda.Net.EntityFrameworkCore;
using System;
using Volo.Abp.Domain.Repositories.EntityFrameworkCore;
using Volo.Abp.EntityFrameworkCore;

namespace Panda.Net.Bases.Announcements;

public class EfCoreAnnouncementRepository : EfCoreRepository<NetDbContext, Announcement, Guid>,
    IAnnouncementRepository
{
    public EfCoreAnnouncementRepository(IDbContextProvider<NetDbContext> dbContextProvider) : base(
        dbContextProvider)
    {
    }
}