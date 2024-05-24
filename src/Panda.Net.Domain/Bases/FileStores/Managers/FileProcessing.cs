using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.StaticFiles;
using Microsoft.Extensions.Configuration;
using System;
using System.IO;
using System.Security.Cryptography;
using System.Threading.Tasks;

namespace Panda.Net.Bases.FileStores.Managers;

public class FileProcessing : IFileProcessing
{
    private readonly IWebHostEnvironment _hostingEnvironment;
    private readonly IConfiguration _configuration;
    private readonly IContentTypeProvider _contentTypeProvider;

    private string SavePath => _configuration["SavePath"].IsNullOrWhiteSpace()
        ? _hostingEnvironment.WebRootPath
        : _configuration["SavePath"]!;


    public FileProcessing(
        IWebHostEnvironment hostingEnvironment,
        IConfiguration configuration,
        IContentTypeProvider contentTypeProvider)
    {
        _hostingEnvironment = hostingEnvironment;
        _configuration = configuration;
        _contentTypeProvider = contentTypeProvider;

        if (!Directory.Exists(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot")))
        {
            Directory.CreateDirectory(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot"));
        }
    }

    public bool IsAbsolutePathExists(string path)
    {
        path = Path.GetDirectoryName(path)!;
        var absolutePath = Path.Combine(SavePath, path);
        if (Directory.Exists(absolutePath))
        {
            return true;
        }

        Directory.CreateDirectory(absolutePath);
        return false;
    }

    public async Task<string> CreateFileToMd5String(IFormFile file, string projectName)
    {
        var result = string.Empty;
        //文件内容+文件名称+项目名称生成盐值
        await using (var stream = file.OpenReadStream())
        {
            var bytes = await stream.GetAllBytesAsync();
            if (bytes.Length == 0)
            {
                throw new FileNotFoundException("未能读取到文件信息");
            }

            if (!file.FileName.IsNullOrWhiteSpace())
            {
                var fileNameBytes = file.FileName.GetBytes();
                result += BitConverter.ToString(MD5.HashData(fileNameBytes));
            }

            if (!projectName.IsNullOrWhiteSpace())
            {
                var projectNameBytes = projectName.GetBytes();
                result += BitConverter.ToString(MD5.HashData(projectNameBytes));
            }

            result += BitConverter.ToString(MD5.HashData(bytes));
            result = BitConverter.ToString(MD5.HashData(result.GetBytes()));
        }

        return result.Replace("-", "").ToLower();
    }

    public async Task WriteFileAsync(FileStore fileStore, IFormFile formFile)
    {
        var path = Path.GetDirectoryName(fileStore.Path)!;
        var absolutePath = Path.Combine(SavePath, path);
        if (!Directory.Exists(absolutePath))
        {
            Directory.CreateDirectory(absolutePath);
        }

        //写入本地文件
        await using var stream = File.Create(Path.Combine(absolutePath, fileStore.Md5 + fileStore.Extension));
        await formFile.CopyToAsync(stream);
    }

    public async Task<(byte[], string?)> DownloadAsync(FileStore fileStore)
    {
        var path = Path.Combine(SavePath, fileStore.Path);
        var bytes = await File.ReadAllBytesAsync(path);
        _contentTypeProvider.TryGetContentType(path, out var contextType);
        return (bytes, contextType);
    }
}