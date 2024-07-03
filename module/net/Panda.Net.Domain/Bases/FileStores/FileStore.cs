using System;
using System.IO;
using Volo.Abp.Auditing;
using Volo.Abp.Domain.Entities.Auditing;
using Volo.Abp.MultiTenancy;

namespace Panda.Net.Bases.FileStores;

public class FileStore : FullAuditedAggregateRoot<Guid>, IMultiTenant, IHasEntityVersion
{
    public FileStore(string md5, string name, string extension, long size, string projectName, string path = "")
    {
        Md5 = md5;
        Name = name;
        Extension = extension;
        Size = size;
        ProjectName = projectName;
        Path = path;
    }

    /// <summary>
    ///文件md5值
    /// </summary>
    public string Md5 { get; set; }

    /// <summary>
    ///文件名称
    /// </summary>
    public string Name { get; set; }
    
    /// <summary>
    ///文件扩展名
    /// </summary>
    public string Extension { get; set; }

    /// <summary>
    ///文件大小 (kb)
    /// </summary>
    public long Size { get; set; }

    /// <summary>
    ///文件相对路径
    /// </summary>
    public string Path { get; set; }

    /// <summary>
    ///文件所属项目名称
    /// </summary>
    public string ProjectName { get; set; }

    public Guid? TenantId { get; set; }

    public int EntityVersion { get; set; }

    public void ProcessingPath()
    {
        var path = ProjectName;
        if (!Extension.IsNullOrWhiteSpace())
        {
            path = System.IO.Path.Combine(ProjectName, Extension[1..]);
        }
        Path = System.IO.Path.Combine(path, Md5 + Extension);
    }
}