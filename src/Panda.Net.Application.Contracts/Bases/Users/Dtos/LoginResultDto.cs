namespace Panda.Net.Bases.Users.Dtos;

/// <summary>
/// 登录结果
/// </summary>
public class LoginResultDto
{
    /// <summary>
    /// token
    /// </summary>
    public string? AccessToken { get; set; }

    /// <summary>
    /// 刷新token
    /// </summary>
    public string RefreshToken { get; set; }

    /// <summary>
    /// token过期时间
    /// </summary>
    public int ExpiresIn { get; set; }

    /// <summary>
    /// token类型
    /// </summary>
    public string TokenType { get; set; }
}