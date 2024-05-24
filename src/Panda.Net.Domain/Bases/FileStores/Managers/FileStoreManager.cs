using Microsoft.AspNetCore.Http;
using Panda.Net.Bases.FileStores.Repositories;
using Panda.Net.Extensions;
using System.Threading.Tasks;
using Volo.Abp;

namespace Panda.Net.Bases.FileStores.Managers;

public class FileStoreManager : NetDomainService, IFileStoreManager
{
    private readonly IFileRepository _fileRepository;
    private readonly IFileProjectNameRepository _fileProjectNameRepository;
    private readonly IFileWhiteListRepository _whiteListRepository;
    private readonly IFileProcessing _fileProcessing;

    public FileStoreManager(IFileRepository fileRepository,
        IFileProjectNameRepository fileProjectNameRepository,
        IFileWhiteListRepository whiteListRepository,
        IFileProcessing fileProcessing)
    {
        _fileRepository = fileRepository;
        _fileProjectNameRepository = fileProjectNameRepository;
        _whiteListRepository = whiteListRepository;
        _fileProcessing = fileProcessing;
    }

    public Task<FileStore?> GetByMd5Async(string md5)
    {
        return _fileRepository.GetByMd5Async(md5);
    }

    public async Task<FileStore> UploadAsync(FileStore fileStore, IFormFile inputFormFile)
    {
        await CheckExtension(fileStore.Extension);
        await CheckProjectName(fileStore.ProjectName);
        fileStore.ProcessingPath();

        var entity = await GetByMd5Async(fileStore.Md5);
        //通过MD5比对 从数据库中读取文件
        if (entity != null)
        {
            //存在就不需要再保存了
            if (_fileProcessing.IsAbsolutePathExists(fileStore.Path))
            {
                return entity;
            }

            //不存在就更新数据库中的路径
            await _fileProcessing.WriteFileAsync(fileStore, inputFormFile);
            return await _fileRepository.UpdateAsync(fileStore);
        }

        await _fileProcessing.WriteFileAsync(fileStore, inputFormFile);
        return await _fileRepository.InsertAsync(fileStore);
    }

    private async Task CheckProjectName(string fileStoreProjectName)
    {
        var fileProject = await _fileProjectNameRepository.GetFileProjectNameAsync(fileStoreProjectName);
        if (fileProject == null)
        {
            throw new UserFriendlyException(L.DisplayValue("DisplayName:NoPath"), "404");
        }
    }

    private async Task CheckExtension(string fileStoreExtension)
    {
        var fileProject = await _whiteListRepository.GetFileWhiteListAsync(fileStoreExtension);
        if (fileProject == null)
        {
            throw new UserFriendlyException(L.DisplayValue("DisplayName:NoFileType"), "404");
        }
    }
}