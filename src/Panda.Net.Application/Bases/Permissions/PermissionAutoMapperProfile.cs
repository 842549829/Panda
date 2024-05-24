using AutoMapper;
using Panda.Net.Bases.Permissions.Dtos;
using Volo.Abp.PermissionManagement;

namespace Panda.Net.Bases.Permissions;

public class PermissionAutoMapperProfile : Profile
{
    public PermissionAutoMapperProfile()
    {
        CreateMap<PermissionTree, PermissionTreeDto>();

        CreateMap<PermissionGroupDefinitionRecord, PermissionGroupDefinitionDto>();
        
        CreateMap<PermissionDefinitionRecord, PermissionDefinitionDto>();
    }
}