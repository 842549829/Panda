using System.Threading.Tasks;
using Panda.Net.Bases.FileStores.Dtos;
using Volo.Abp.Application.Services;

namespace Panda.Net.Bases.FileStores;

public interface IFileStoreAppService : IApplicationService
{
    Task<FileInfoDto> UploadAsync(ProjectFileUploadInputDto input);

    Task<FileResultDto> DownloadAsync(string md5);
}