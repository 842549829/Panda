using Panda.DataPermission.Abstractions.DataPermission;

namespace Panda.DataPermission.AspNetCore;

public class CookieDataPermissionResolveContributor : HttpDataPermissionResolveContributorBase
{
    public const string ContributorName = "Cookie";

    /// <summary>
    /// 参与者名称
    /// </summary>
    public override string Name => ContributorName;
        
    protected override Task<(string?, Panda.DataPermission.Abstractions.DataPermission.DataPermission?)> GetDataPermissionFromHttpContextOrNullAsync(IDataPermissionResolveContext context, HttpContext httpContext)
    {
        var code  = httpContext.Request.Cookies[context.GetPandaAspDataPermissionOptions().DataPermissionCodeKey];
        var dataPermission = httpContext.Request.Cookies[context.GetPandaAspDataPermissionOptions().DataPermissionKey]?.ToDataPermission();
        return Task.FromResult((code, dataPermission));
    }
}