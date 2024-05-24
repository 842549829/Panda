using System;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Panda.Net.Bases.FileStores.Dtos;
using Panda.Net.Bases.FileStores.Managers;

namespace Panda.Net.Bases.FileStores;

public class FileStoreAppService : NetAppService, IFileStoreAppService
{
    private readonly IFileStoreManager _fileStoreManager;
    private readonly IFileProcessing _fileProcessing;

    public FileStoreAppService(IFileStoreManager fileStoreManager,
        IFileProcessing fileProcessing)
    {
        _fileStoreManager = fileStoreManager;
        _fileProcessing = fileProcessing;
    }

    public async Task<FileInfoDto> UploadAsync(ProjectFileUploadInputDto input)
    {
        var fileName = input.FormFile.FileName.Trim();
        var extension = Path.GetExtension(fileName);
        fileName = Path.GetFileNameWithoutExtension(fileName);
        var md5 = await _fileProcessing.CreateFileToMd5String(input.FormFile, input.ProjectName);
        var fileStore = new FileStore(md5, fileName, extension, input.FormFile.Length, input.ProjectName);
        var entity = await _fileStoreManager.UploadAsync(fileStore, input.FormFile);
        return ObjectMapper.Map<FileStore, FileInfoDto>(entity);
    }

    public async Task<FileResultDto> DownloadAsync(string md5)
    {
        var fileStore = await _fileStoreManager.GetByMd5Async(md5);
        if (fileStore == null || fileStore.Path.IsNullOrWhiteSpace())
        {
            throw new FileNotFoundException("找不到对应的文件");
        }
        var (bytes, contextType) = await _fileProcessing.DownloadAsync(fileStore);
        var fileDownloadName = string.Empty;

        //如果不是响应类型 就直接提供文件下载
        var mime = new[]
        {
            "image/jpeg",
            "jpeg",
            "bmp",
            "jpg,png",
            "image/png",
            "tif",
            "gif",
            "pcx",
            "tga",
            "exif",
            "fpx",
            "svg",
            "psd",
            "cdr",
            "pcd",
            "dxf",
            "ufo",
            "eps",
            "ai",
            "raw",
            "WMF",
            "application/pdf"
        };

        if (!mime.Contains(contextType))
        {
            fileDownloadName = fileStore.Name + fileStore.Extension;
        }

        return new FileResultDto
        {
            ContextType = contextType,
            FileBytes = bytes,
            FileDownloadName = fileDownloadName
        };
    }
}