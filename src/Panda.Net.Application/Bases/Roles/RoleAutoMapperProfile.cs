using AutoMapper;
using Panda.Net.Bases.Permissions;
using Panda.Net.Bases.Roles.Dtos;
using Volo.Abp.Identity;
using Volo.Abp.PermissionManagement;

namespace Panda.Net.Bases.Roles;

public class RoleAutoMapperProfile : Profile
{
    public RoleAutoMapperProfile()
    {
        CreateMap<UpdatePermissionDto, UpdatePermission>();

        CreateMap<IdentityRole, RoleDto>();
    }
}