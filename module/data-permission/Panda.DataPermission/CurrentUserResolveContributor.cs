using Microsoft.Extensions.DependencyInjection;
using Panda.DataPermission.Abstractions.DataPermission;
using Volo.Abp.Security.Claims;
using Volo.Abp.Users;

namespace Panda.DataPermission;

public class CurrentUserResolveContributor : DataPermissionResolveContributorBase
{
    public const string ContributorName = "CurrentUser";

    /// <summary>
    /// 参与者名称
    /// </summary>
    public override string Name => ContributorName;

    /// <summary>
    /// 解析数据权限方法
    /// </summary>
    /// <param name="context">数据权限当前上下文接口</param>
    /// <returns>异步</returns>
    public override async Task ResolveAsync(IDataPermissionResolveContext context)
    {
        var currentUser = context.ServiceProvider.GetRequiredService<ICurrentUser>();
        if (currentUser.IsAuthenticated)
        {
            // 得到用户角色 
            var roles = currentUser.FindClaims(AbpClaimTypes.Role).Select(c => c.Value).ToArray();
            // 查询用户角色数据权限
            var dataPermissionManager = context.ServiceProvider.GetRequiredService<IDataPermissionManager>();
            var (dataPermission, dataPermissionCode) = await dataPermissionManager.GetDataPermissionsAsync(roles);
            context.Handled = true;
            context.DataPermission = dataPermission;
            context.DataPermissionCode = dataPermissionCode;
        }
    }
}