using System;
using System.ComponentModel.DataAnnotations;

namespace Panda.Net.Bases.Users.Dtos;

public class LoginInputDto
{
    /// <summary>
    /// 帐号
    /// </summary>
    [Required(ErrorMessage = "帐号不能为空")]
    [MaxLength(20, ErrorMessage = "帐号长度最长为20位字符")]
    public string UserName { get; set; } = default!;

    /// <summary>
    /// 登录凭证
    /// </summary>
    [Required(ErrorMessage = "验证密码不能为空")]
    public string Password { get; set; } = default!;

    /// <summary>
    /// 租户Id
    /// </summary>
    public Guid? TenantId { get; set; }
}