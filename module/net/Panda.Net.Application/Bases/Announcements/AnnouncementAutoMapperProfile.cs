using AutoMapper;
using Panda.Net.Bases.Announcements.Dtos;
using Panda.Net.Bases.Announcements.Entities;
using Panda.Net.Enums;
using System;

namespace Panda.Net.Bases.Announcements;

public class AnnouncementAutoMapperProfile : Profile
{
    public AnnouncementAutoMapperProfile()
    {
        CreateMap<Announcement, AnnouncementDto>().ForMember(d => d.PublishType,
            s => s.MapFrom(c =>
                c.PublishType == PublishType.Immediately
                    ? PublishType.Immediately
                    : c.PublishTime < DateTime.Now
                        ? PublishType.Immediately
                        : PublishType.Delay));
        CreateMap<Announcement,AnnouncementListDto>().ForMember(d => d.PublishType,
            s => s.MapFrom(c =>
                c.PublishType == PublishType.Immediately
                    ? PublishType.Immediately
                    : c.PublishTime < DateTime.Now
                        ? PublishType.Immediately
                        : PublishType.Delay));
        CreateMap<AnnouncementCreateInputDto, Announcement>();
        CreateMap<AnnouncementUpdateInputDto, Announcement>();
    }
}