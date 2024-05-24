namespace Panda.Net.Options;

/// <summary>
/// 授权客户端
/// </summary>
public class AuthServerOptions
{
    /// <summary>
    /// 客户端Id
    /// </summary>
    public string ClientId { get; set; }

    /// <summary>
    /// 客户端key
    /// </summary>
    public string ClientSecret { get; set; }

    /// <summary>
    /// 范围
    /// </summary>
    public string Scope { get; set; }

    /// <summary>
    /// GrantType类型
    /// </summary>
    public string GrantType { get; set; }

    /// <summary>
    /// 地址
    /// </summary>
    public string Authority { get; set; }

    /// <summary>
    /// is https
    /// </summary>
    public bool RequireHttpsMetadata { get; set; }
}