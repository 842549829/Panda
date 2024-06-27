using Panda.Net.Bases.Roles.Dtos;
using Panda.Net.Bases.Users.Dtos;
using Panda.Net.Identity;
using Volo.Abp.Account;
using Volo.Abp.Identity;
using Volo.Abp.ObjectExtending;
using Volo.Abp.Threading;

namespace Panda.Net;

public static class NetDtoExtensions
{
    private static readonly OneTimeRunner OneTimeRunner = new OneTimeRunner();

    public static void Configure()
    {
        OneTimeRunner.Run(() =>
        {
            /* You can add extension properties to DTOs
             * defined in the depended modules.
             *
             * Example:
             *
             * ObjectExtensionManager.Instance
             *   .AddOrUpdateProperty<IdentityRoleDto, string>("Title");
             *
             * See the documentation for more:
             * https://docs.abp.io/en/abp/latest/Object-Extensions
             */

            ObjectExtensionManager.Instance
                .AddOrUpdateProperty<string>(new[]
                    {
                        typeof(IdentityUserDto),
                        typeof(IdentityUserCreateDto),
                        typeof(IdentityUserUpdateDto),
                        typeof(ProfileDto),
                        typeof(UpdateProfileDto)
                    },
                    IdentityUserExtensionConsts.OpenId)
                .AddOrUpdateProperty<string>(new[]
                    {
                        typeof(IdentityUserDto),
                        typeof(IdentityUserCreateDto),
                        typeof(IdentityUserUpdateDto),
                        typeof(ProfileDto),
                        typeof(UpdateProfileDto),
                        typeof(UserAvatarUpdateDto)
                    },
                    IdentityUserExtensionConsts.Avatar);

            ObjectExtensionManager.Instance
                .AddOrUpdateProperty<int>(new[]
                    {
                        typeof(IdentityRoleDto),
                        typeof(IdentityRoleCreateDto),
                        typeof(IdentityRoleUpdateDto),
                        typeof(RoleCreateDto),
                        typeof(RoleUpdateDto)
                    },
                    IdentityRoleExtensionConsts.DataPermission)
                .AddOrUpdateProperty<string>(new[]
                    {
                        typeof(IdentityRoleDto),
                        typeof(IdentityRoleCreateDto),
                        typeof(IdentityRoleUpdateDto),
                        typeof(RoleCreateDto),
                        typeof(RoleUpdateDto)
                    },
                    IdentityRoleExtensionConsts.CustomDataPermission);
        });
    }
}