using AutoMapper;
using Panda.DataDictionary.Application.Contracts.DataDictionaries.DictCategories.Dtos;
using Panda.DataDictionary.Domain.DataDictionaries.Entities;

namespace Panda.DataDictionary.Application.DataDictionaries;

public class DictItemAutoMapperProfile : Profile
{
    public DictItemAutoMapperProfile()
    {
        CreateMap<DictItem, DictItemDto>()
            .MapExtraProperties();
    }
}