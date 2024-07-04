using Panda.Application.Contracts.Permissions;
using Panda.DataDictionary.Domain.Shared.Localization;
using Panda.Domain.Shared.Consts;
using Panda.Domain.Shared.Enums;
using Volo.Abp.Authorization.Permissions;
using Volo.Abp.Localization;

namespace Panda.DataDictionary.Application.Contracts.Permissions;

public class DataDictionaryPermissionDefinitionProvider : PermissionDefinitionProvider
{
    public override void Define(IPermissionDefinitionContext context)
    {
        var basicsGroup = context.AddGroup(PandaPermissions.GroupName, L("DisplayName:Basic"));
        basicsGroup[PermissionDefinitionConsts.Type] = PermissionType.Module;
        basicsGroup[PermissionDefinitionConsts.Path] = "/basic";
        basicsGroup[PermissionDefinitionConsts.Icon] = "basic";
        var rolesPermission = basicsGroup.AddPermission(DataDictionaryPermissions.DataDictionary.Default, L("DisplayName:DataDictionaryManagement"))
            .WithProviders(PermissionDefinitionConsts.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Menu)
            .WithProperty(PermissionDefinitionConsts.Path, "/role")
            .WithProperty(PermissionDefinitionConsts.Icon, "role");
        rolesPermission.AddChild(DataDictionaryPermissions.DataDictionary.Create, L("DisplayName:Create"))
            .WithProviders(PermissionDefinitionConsts.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Button)
            .WithProperty(PermissionDefinitionConsts.Path, "create");
        rolesPermission.AddChild(DataDictionaryPermissions.DataDictionary.Update, L("DisplayName:Edit"))
            .WithProviders(PermissionDefinitionConsts.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Button)
            .WithProperty(PermissionDefinitionConsts.Path, "edit");
        rolesPermission.AddChild(DataDictionaryPermissions.DataDictionary.Delete, L("DisplayName:Delete"))
            .WithProviders(PermissionDefinitionConsts.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Button)
            .WithProperty(PermissionDefinitionConsts.Path, "delete");
    }

    private static ILocalizableString L(string name)
    {
        return LocalizableString.Create<DataDictionaryResource>(name);
    }
}