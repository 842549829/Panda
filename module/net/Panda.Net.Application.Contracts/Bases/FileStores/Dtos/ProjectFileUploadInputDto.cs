using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Http;

namespace Panda.Net.Bases.FileStores.Dtos;

public class ProjectFileUploadInputDto
{
    /// <summary>
    /// 文件
    /// </summary>
    [Required]
    public IFormFile FormFile { get; set; }

    /// <summary>
    ///项目名称
    /// </summary>
    [Required]
    [StringLength(64)]
    public string ProjectName { get; set; }
}