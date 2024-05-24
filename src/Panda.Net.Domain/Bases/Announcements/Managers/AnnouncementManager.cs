using Panda.Net.Bases.Announcements.Entities;
using Panda.Net.Bases.Announcements.Repositories;
using System.Threading.Tasks;
using Volo.Abp.Domain.Services;

namespace Panda.Net.Bases.Announcements.Managers;

public class AnnouncementManager : DomainService, IAnnouncementManager
{
    private readonly IAnnouncementRepository _announcementRepository;

    public AnnouncementManager(IAnnouncementRepository announcementRepository)
    {
        _announcementRepository = announcementRepository;
    }

    public Task<Announcement> CreateAsync(Announcement entity)
    {
        return _announcementRepository.InsertAsync(entity, true);
    }

    public Task<Announcement> UpdateAsync(Announcement entity)
    {
        return _announcementRepository.UpdateAsync(entity, true);
    }
}