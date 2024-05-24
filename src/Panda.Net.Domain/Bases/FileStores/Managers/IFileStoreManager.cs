using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Volo.Abp.Domain.Services;

namespace Panda.Net.Bases.FileStores.Managers;

public interface IFileStoreManager : IDomainService
{
    Task<FileStore> UploadAsync(FileStore fileStore, IFormFile inputFormFile);

    Task<FileStore?> GetByMd5Async(string md5);
}