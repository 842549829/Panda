using AutoMapper;
using Panda.Net.Bases.Organizations.Dtos;
using Volo.Abp.Identity;

namespace Panda.Net.Bases.Organizations;

public class OrganizationAutoMapperProfile : Profile
{
    public OrganizationAutoMapperProfile()
    {
        CreateMap<OrganizationUnit, OrganizationDto>();
        CreateMap<OrganizationUnit, OrganizationTreeDto>();
        CreateMap<OrganizationUnit, OrganizationSelectDto>();
    }
}