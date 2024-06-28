using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.StaticFiles;
using Microsoft.Extensions.Configuration;
using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;
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
        //var result = string.Empty;
        ////文件内容+文件名称+项目名称生成盐值
        //await using (var stream = file.OpenReadStream())
        //{
        //    var bytes = await stream.GetAllBytesAsync();
        //    if (bytes.Length == 0)
        //    {
        //        throw new FileNotFoundException("未能读取到文件信息");
        //    }

        //    if (!file.FileName.IsNullOrWhiteSpace())
        //    {
        //        var fileNameBytes = file.FileName.GetBytes();
        //        result += BitConverter.ToString(MD5.HashData(fileNameBytes));
        //    }

        //    if (!projectName.IsNullOrWhiteSpace())
        //    {
        //        var projectNameBytes = projectName.GetBytes();
        //        result += BitConverter.ToString(MD5.HashData(projectNameBytes));
        //    }

        //    result += BitConverter.ToString(MD5.HashData(bytes));
        //    result = BitConverter.ToString(MD5.HashData(result.GetBytes()));
        //}

        //return result.Replace("-", "").ToLower();

        return await FileHashHelper.CreateFileToMd5String(file, projectName);
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
        //await using var stream = File.Create(Path.Combine(absolutePath, fileStore.Md5 + fileStore.Extension));
        //await formFile.CopyToAsync(stream);


        // 添加一个缓冲区  
        // 确定缓冲区大小，这里假设为 81920 字节，即 80 KB  
        const int bufferSize = 81920;
        var buffer = new byte[bufferSize];
        // 使用 await using 确保 fileOutputStream 在使用后被正确关闭和释放  
        await using var fileOutputStream = new FileStream(Path.Combine(absolutePath, fileStore.Md5 + fileStore.Extension), FileMode.Create);

        // 打开文件流，只打开一次  
        await using (var formFileStream = formFile.OpenReadStream())
        {
            // 循环读取 formFileStream 并写入 fileOutputStream，直到读取完毕  
            int bytesRead;
            while ((bytesRead = await formFileStream.ReadAsync(buffer, 0, bufferSize)) > 0)
            {
                // 将读取的数据写入到 fileOutputStream 中  
                await fileOutputStream.WriteAsync(buffer, 0, bytesRead);
            }
        }
        // formFileStream 将在 using 块结束时自动关闭和释放  
        // fileOutputStream 将在 await using 块结束时自动关闭和释放
    }

    public async Task<(byte[], string?)> DownloadAsync(FileStore fileStore)
    {
        var path = Path.Combine(SavePath, fileStore.Path);
        var bytes = await File.ReadAllBytesAsync(path);
        _contentTypeProvider.TryGetContentType(path, out var contextType);
        return (bytes, contextType);
    }
}

public class FileHashHelper
{
    public static async Task<string> CreateFileToMd5String(IFormFile file, string projectName)
    {
        using (var md5 = MD5.Create())
        {
            // 创建一个StringBuilder来拼接各个部分的哈希值（如果需要的话）  
            var stringBuilder = new StringBuilder();

            // 如果文件名不为空，计算文件名的MD5哈希值并添加到StringBuilder中  
            if (!string.IsNullOrWhiteSpace(file.FileName))
            {
                var fileNameHash = ComputeHash(md5, Encoding.UTF8.GetBytes(file.FileName));
                stringBuilder.Append(fileNameHash);
            }

            // 如果项目名称不为空，计算项目名称的MD5哈希值并添加到StringBuilder中  
            if (!string.IsNullOrWhiteSpace(projectName))
            {
                var projectNameHash = ComputeHash(md5, Encoding.UTF8.GetBytes(projectName));
                stringBuilder.Append(projectNameHash);
            }

            // 计算文件内容的MD5哈希值  
            await using (var stream = file.OpenReadStream())
            {
                var fileHash = await ComputeHashAsync(md5, stream);
                stringBuilder.Append(fileHash);
            }

            // 如果需要，可以计算整个拼接字符串的MD5哈希值（这里省略，因为通常不需要）  

            // 将StringBuilder中的哈希值转换为没有短划线的小写形式  
            return stringBuilder.ToString().Replace("-", "").ToLower();
        }
    }

    private static string ComputeHash(HashAlgorithm md5Hash, byte[] input)
    {
        // 计算输入字节数组的MD5哈希值  
        var data = md5Hash.ComputeHash(input);
        // 使用BitConverter将字节数组转换为十六进制表示的字符串  
        var sBuilder = new StringBuilder();

        foreach (var t in data)
        {
            sBuilder.Append(t.ToString("x2"));
        }
        return sBuilder.ToString();
    }

    private static async Task<string> ComputeHashAsync(MD5 md5Hash, Stream stream)
    {
        // 分块读取并计算流内容的MD5哈希值  
        const int bufferSize = 4096; // 缓冲区大小，可以根据需要调整  
        var buffer = new byte[bufferSize];
        var hash = md5Hash;

        int bytesRead;
        while ((bytesRead = await stream.ReadAsync(buffer, 0, buffer.Length)) != 0)
        {
            hash.TransformBlock(buffer, 0, bytesRead, null, 0);
        }

        hash.TransformFinalBlock(Array.Empty<byte>(), 0, 0);

        var hashBytes = hash.Hash;
        var sBuilder = new StringBuilder();
        if (hashBytes == null)
        {
            return sBuilder.ToString();
        }
        foreach (var t in hashBytes)
        {
            sBuilder.Append(t.ToString("x2"));
        }
        return sBuilder.ToString();
    }
}