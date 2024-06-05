using Microsoft.Extensions.DependencyInjection;
using Panda.DataPermission.Abstractions.DataPermission;
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
    public override Task ResolveAsync(IDataPermissionResolveContext context)
    {
        var currentUser = context.ServiceProvider.GetRequiredService<ICurrentUser>();
        if (currentUser.IsAuthenticated)
        {
            context.Handled = true;
            context.DataPermission = (Abstractions.DataPermission.DataPermission)Convert.ToInt32(currentUser.FindClaim(DataPermissionResolverConsts.DefaultDataPermissionKey)?.Value);
            context.DataPermissionCode = currentUser.FindClaim(DataPermissionResolverConsts.DefaultDataPermissionCodeKey)?.Value;
        }

        return Task.CompletedTask;
    }
}