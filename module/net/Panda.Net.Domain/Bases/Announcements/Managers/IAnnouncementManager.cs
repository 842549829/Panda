using Panda.Net.Bases.Announcements.Entities;
using System.Threading.Tasks;
using Volo.Abp.Domain.Services;

namespace Panda.Net.Bases.Announcements.Managers;


public interface IAnnouncementManager : IDomainService
{
    Task<Announcement> CreateAsync(Announcement entity);

    Task<Announcement> UpdateAsync(Announcement entity);
}