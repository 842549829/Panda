namespace Panda.Net.Identity;

/// <summary>
/// IdentityUser扩展常量
/// </summary>
public static class IdentityUserExtensionConsts
{
    /// <summary>
    /// OpenId
    /// </summary>
    public const string OpenId = "OpenId";

    /// <summary>
    /// 头像
    /// </summary>
    public const string Avatar = "Avatar";

    /// <summary>
    /// MaxOpenIdLength
    /// </summary>
    public static int MaxOpenIdLength { get; set; } = 256;

    /// <summary>
    /// MaxAvatarLength
    /// </summary>
    public static int MaxAvatarLength { get; set; } = 512;
}