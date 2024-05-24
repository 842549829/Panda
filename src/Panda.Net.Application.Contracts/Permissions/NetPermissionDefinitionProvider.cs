using Panda.Net.Constants;
using Panda.Net.Enums;
using Panda.Net.Localization;
using Volo.Abp.Authorization.Permissions;
using Volo.Abp.Localization;

namespace Panda.Net.Permissions;

public class NetPermissionDefinitionProvider : PermissionDefinitionProvider
{
    public override void Define(IPermissionDefinitionContext context)
    {
        var basicsGroup = context.AddGroup(NetPermissions.GroupName, L("DisplayName:Basic"));
        basicsGroup[PermissionDefinitionConsts.Type] = PermissionType.Module;
        basicsGroup[PermissionDefinitionConsts.Path] = "/basic";
        basicsGroup[PermissionDefinitionConsts.Icon] = "basic";
        var rolesPermission = basicsGroup.AddPermission(NetPermissions.Roles.Default, L("DisplayName:RoleManagement"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Menu)
            .WithProperty(PermissionDefinitionConsts.Path, "/role")
            .WithProperty(PermissionDefinitionConsts.Icon, "role");
        rolesPermission.AddChild(NetPermissions.Roles.Create, L("DisplayName:Create"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Button)
            .WithProperty(PermissionDefinitionConsts.Path, "create");
        rolesPermission.AddChild(NetPermissions.Roles.Update, L("DisplayName:Edit"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Button)
            .WithProperty(PermissionDefinitionConsts.Path, "edit");
        rolesPermission.AddChild(NetPermissions.Roles.Delete, L("DisplayName:Delete"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Button)
            .WithProperty(PermissionDefinitionConsts.Path, "delete");

        var usersPermission = basicsGroup.AddPermission(NetPermissions.Users.Default, L("DisplayName:UserManagement"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Menu)
            .WithProperty(PermissionDefinitionConsts.Path, "/user")
            .WithProperty(PermissionDefinitionConsts.Icon, "user");
        usersPermission.AddChild(NetPermissions.Users.Create, L("DisplayName:Create"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Button)
            .WithProperty(PermissionDefinitionConsts.Path, "create");
        usersPermission.AddChild(NetPermissions.Users.Update, L("DisplayName:Edit"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Button)
            .WithProperty(PermissionDefinitionConsts.Path, "edit");
        usersPermission.AddChild(NetPermissions.Users.Delete, L("DisplayName:Delete"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Button)
            .WithProperty(PermissionDefinitionConsts.Path, "delete");

        var meenuPermission = basicsGroup.AddPermission(NetPermissions.Menu.Default, L("DisplayName:MenuManagement"))
               .WithProviders(RolePermissionValueProvider.ProviderName)
               .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Menu)
               .WithProperty(PermissionDefinitionConsts.Path, "/user")
               .WithProperty(PermissionDefinitionConsts.Icon, "user");
        meenuPermission.AddChild(NetPermissions.Menu.Create, L("DisplayName:Create"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Button)
            .WithProperty(PermissionDefinitionConsts.Path, "create");
        meenuPermission.AddChild(NetPermissions.Menu.Update, L("DisplayName:Edit"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Button)
            .WithProperty(PermissionDefinitionConsts.Path, "edit");
        meenuPermission.AddChild(NetPermissions.Menu.Delete, L("DisplayName:Delete"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Button)
            .WithProperty(PermissionDefinitionConsts.Path, "delete");

        var organizationPermission = basicsGroup.AddPermission(NetPermissions.Organization.Default, L("DisplayName:OrganizationManagement"))
               .WithProviders(RolePermissionValueProvider.ProviderName)
               .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Menu)
               .WithProperty(PermissionDefinitionConsts.Path, "/user")
               .WithProperty(PermissionDefinitionConsts.Icon, "user");
        organizationPermission.AddChild(NetPermissions.Organization.Create, L("DisplayName:Create"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Button)
            .WithProperty(PermissionDefinitionConsts.Path, "create");
        organizationPermission.AddChild(NetPermissions.Organization.Update, L("DisplayName:Edit"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Button)
            .WithProperty(PermissionDefinitionConsts.Path, "edit");
        organizationPermission.AddChild(NetPermissions.Organization.Delete, L("DisplayName:Delete"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Button)
            .WithProperty(PermissionDefinitionConsts.Path, "delete");

        var tenantPermission = basicsGroup.AddPermission(NetPermissions.Tenant.Default, L("DisplayName:TenantManagement"))
              .WithProviders(RolePermissionValueProvider.ProviderName)
              .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Menu)
              .WithProperty(PermissionDefinitionConsts.Path, "/user")
              .WithProperty(PermissionDefinitionConsts.Icon, "user");
        tenantPermission.AddChild(NetPermissions.Tenant.Create, L("DisplayName:Create"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Button)
            .WithProperty(PermissionDefinitionConsts.Path, "create");
        tenantPermission.AddChild(NetPermissions.Tenant.Update, L("DisplayName:Edit"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Button)
            .WithProperty(PermissionDefinitionConsts.Path, "edit");
        tenantPermission.AddChild(NetPermissions.Tenant.Delete, L("DisplayName:Delete"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Button)
            .WithProperty(PermissionDefinitionConsts.Path, "delete");

        var announcementPermission = basicsGroup.AddPermission(NetPermissions.Announcement.Default, L("DisplayName:AnnouncementManagement"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Menu)
            .WithProperty(PermissionDefinitionConsts.Path, "announcement")
            .WithProperty(PermissionDefinitionConsts.Icon, "user");
        announcementPermission.AddChild(NetPermissions.Announcement.Create, L("DisplayName:Create"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Button)
            .WithProperty(PermissionDefinitionConsts.Path, "create");
        announcementPermission.AddChild(NetPermissions.Announcement.Update, L("DisplayName:Edit"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Button)
            .WithProperty(PermissionDefinitionConsts.Path, "edit");
        announcementPermission.AddChild(NetPermissions.Announcement.Delete, L("DisplayName:Delete"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Button)
            .WithProperty(PermissionDefinitionConsts.Path, "delete");

        var workFlowListPermission = basicsGroup.AddPermission(NetPermissions.WorkFlowList.Default, L("DisplayName:WorkFlowListManagement"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Menu)
            .WithProperty(PermissionDefinitionConsts.Path, "workflow-list")
            .WithProperty(PermissionDefinitionConsts.Icon, "workflow");
        workFlowListPermission.AddChild(NetPermissions.WorkFlowList.Create, L("DisplayName:Create"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Button)
            .WithProperty(PermissionDefinitionConsts.Path, "create");
        workFlowListPermission.AddChild(NetPermissions.WorkFlowList.Update, L("DisplayName:Edit"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Button)
            .WithProperty(PermissionDefinitionConsts.Path, "edit");
        workFlowListPermission.AddChild(NetPermissions.WorkFlowList.Delete, L("DisplayName:Delete"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Button)
            .WithProperty(PermissionDefinitionConsts.Path, "delete");
        workFlowListPermission.AddChild(NetPermissions.WorkFlowList.Start, L("DisplayName:Start"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Button)
            .WithProperty(PermissionDefinitionConsts.Path, "start");

        var workFlowCreatePermission = basicsGroup.AddPermission(NetPermissions.WorkFlowCreate.Default, L("DisplayName:WorkFlowCreateManagement"))
            .WithProviders(RolePermissionValueProvider.ProviderName)
            .WithProperty(PermissionDefinitionConsts.Type, PermissionType.Menu)
            .WithProperty(PermissionDefinitionConsts.Path, "workflow-create")
            .WithProperty(PermissionDefinitionConsts.Icon, "workflow");
    }

    // 写成固定字符串  这里就直接传入菜的名称即可
    //private static ILocalizableString L(string name)
    //{
    //    return new FixedLocalizableString(name);
    //}

    private static ILocalizableString L(string name)
    {
        return LocalizableString.Create<NetResource>(name);
    }
}
