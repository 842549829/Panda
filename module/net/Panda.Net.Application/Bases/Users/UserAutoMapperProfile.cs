using AutoMapper;
using Panda.Net.Bases.Users.Dtos;
using Volo.Abp.Identity;

namespace Panda.Net.Bases.Users;

public class UserAutoMapperProfile : Profile
{
    public UserAutoMapperProfile()
    {
        //CreateMap<IdentityUser, IdentityUserDto>()
        //    .MapExtraProperties();
        CreateMap<IdentityUser, IdentityUserDetailDto>()
            .MapExtraProperties();
    }
}