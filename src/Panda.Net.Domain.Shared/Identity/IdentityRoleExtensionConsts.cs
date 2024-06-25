namespace Panda.Net.Identity;

/// <summary>
/// IdentityRoleExtension constants.
/// </summary>
public class IdentityRoleExtensionConsts
{
    /// <summary>
    /// DataPermission
    /// </summary>
    public const string DataPermission = "DataPermission";

    /// <summary>
    /// CustomDataPermission
    /// </summary>
    public const string CustomDataPermission = "CustomDataPermission";

    /// <summary>
    /// MaxCustomDataPermissionLength
    /// </summary>
    public static int MaxCustomDataPermissionLength { get; set; } = 4096;
}