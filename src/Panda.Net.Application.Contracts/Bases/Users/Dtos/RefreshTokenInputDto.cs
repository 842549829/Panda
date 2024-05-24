using System.ComponentModel.DataAnnotations;

namespace Panda.Net.Bases.Users.Dtos;

/// <summary>
/// 刷新token
/// </summary>
public class RefreshTokenInputDto
{
    /// <summary>
    /// 刷新token
    /// </summary>
    [Required(ErrorMessage = "刷新token不能为空")]
    public string RefreshToken { get; set; }
}