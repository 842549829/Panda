using System;

namespace Panda.Net.Bases.FileStores.Dtos;

public class FileInfoDto
{
    /// <summary>
    /// 文件Id
    /// </summary>
    public string Md5 { get; set; }

    /// <summary>
    /// 文件名称
    /// </summary>
    public string Name { get; set; }

    /// <summary>
    /// 文件扩展名称
    /// </summary>
    public string Extension { get; set; }

    /// <summary>
    /// 文件大小 byte
    /// </summary>
    public long Size { get; set; }

    /// <summary>
    ///创建日期
    /// </summary>
    public DateTime CreationTime { get; set; }
}