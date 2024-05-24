using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Volo.Abp.DependencyInjection;

namespace Panda.Net.Bases.FileStores.Managers;

public interface IFileProcessing : ISingletonDependency
{
    bool IsAbsolutePathExists(string path);

    Task<string> CreateFileToMd5String(IFormFile file, string projectName);

    Task WriteFileAsync(FileStore fileStore, IFormFile formFile);

    Task<(byte[], string?)> DownloadAsync(FileStore fileStore);
}