using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Panda.Net.Bases.FileStores;
using Panda.Net.Bases.FileStores.Dtos;

namespace Panda.Net.Controllers.Bases;

[Route("api/basics/files")]
[ApiController]
[AllowAnonymous]
public class FileController : NetController
{
    private readonly IFileStoreAppService _fileStoreAppService;

    public FileController(IFileStoreAppService fileStoreAppService)
    {
        _fileStoreAppService = fileStoreAppService;
    }

    [HttpPost]
    public Task<FileInfoDto> UploadAsync(
        [FromForm] ProjectFileUploadInputDto input)
    {
        return _fileStoreAppService.UploadAsync(input);
    }

    [HttpGet("{md5}")]
    public async Task<FileResult> DownloadAsync(string md5)
    {
        var fileResultDto = await _fileStoreAppService.DownloadAsync(md5);
        return File(fileResultDto.FileBytes, fileResultDto.ContextType ?? "application/octet-stream", fileResultDto.FileDownloadName);
    }
}