using Microsoft.EntityFrameworkCore;
using Panda.Net.Identity;
using Volo.Abp.Identity;
using Volo.Abp.ObjectExtending;
using Volo.Abp.Threading;

namespace Panda.Net.EntityFrameworkCore;

public static class NetEfCoreEntityExtensionMappings
{
    private static readonly OneTimeRunner OneTimeRunner = new OneTimeRunner();

    public static void Configure()
    {
        NetGlobalFeatureConfigurator.Configure();
        NetModuleExtensionConfigurator.Configure();

        OneTimeRunner.Run(() =>
        {
            /* You can configure extra properties for the
             * entities defined in the modules used by your application.
             *
             * This class can be used to map these extra properties to table fields in the database.
             *
             * USE THIS CLASS ONLY TO CONFIGURE EF CORE RELATED MAPPING.
             * USE NetModuleExtensionConfigurator CLASS (in the Domain.Shared project)
             * FOR A HIGH LEVEL API TO DEFINE EXTRA PROPERTIES TO ENTITIES OF THE USED MODULES
             *
             * Example: Map a property to a table field:

                 ObjectExtensionManager.Instance
                     .MapEfCoreProperty<IdentityUser, string>(
                         "MyProperty",
                         (entityBuilder, propertyBuilder) =>
                         {
                             propertyBuilder.HasMaxLength(128);
                         }
                     );

             * See the documentation for more:
             * https://docs.abp.io/en/abp/latest/Customizing-Application-Modules-Extending-Entities
             */
            ObjectExtensionManager
                .Instance
                .MapEfCoreProperty<IdentityUser, string>(IdentityUserExtensionConsts.OpenId,
                    (_, propertyBuilder) =>
                    {
                        propertyBuilder.HasMaxLength(IdentityUserExtensionConsts.MaxOpenIdLength);
                        propertyBuilder.HasDefaultValue(string.Empty);
                        propertyBuilder.IsRequired();
                    })
                .MapEfCoreProperty<IdentityUser, string>(IdentityUserExtensionConsts.Avatar,
                    (_, propertyBuilder) =>
                    {
                        propertyBuilder.HasMaxLength(IdentityUserExtensionConsts.MaxAvatarLength);
                        propertyBuilder.HasDefaultValue(string.Empty);
                        propertyBuilder.IsRequired();
                    });

            ObjectExtensionManager
                .Instance
                .MapEfCoreProperty<IdentityRole, int>(IdentityRoleExtensionConsts.DataPermission,
                    (_, propertyBuilder) =>
                    {
                        propertyBuilder.HasDefaultValue(0);
                        propertyBuilder.IsRequired();
                    })
                .MapEfCoreProperty<IdentityRole, string>(IdentityRoleExtensionConsts.CustomDataPermission,
                    (_, propertyBuilder) =>
                    {
                        propertyBuilder.HasMaxLength(IdentityRoleExtensionConsts.MaxCustomDataPermissionLength);
                        propertyBuilder.HasDefaultValue(string.Empty);
                        propertyBuilder.IsRequired();
                    });
        });
    }
}