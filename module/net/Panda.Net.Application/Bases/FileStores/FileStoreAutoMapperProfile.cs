using AutoMapper;
using Panda.Net.Bases.FileStores.Dtos;

namespace Panda.Net.Bases.FileStores;

public class FileStoreAutoMapperProfile : Profile
{
    public FileStoreAutoMapperProfile()
    {
        CreateMap<FileStore, FileInfoDto>();
    }
}