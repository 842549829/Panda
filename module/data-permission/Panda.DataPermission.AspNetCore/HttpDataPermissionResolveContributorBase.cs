using Panda.DataPermission.Abstractions.DataPermission;
using Volo.Abp;

namespace Panda.DataPermission.AspNetCore;

public abstract class HttpDataPermissionResolveContributorBase : DataPermissionResolveContributorBase
{
    public override async Task ResolveAsync(IDataPermissionResolveContext context)
    {
        var httpContext = context.GetHttpContext();
        if (httpContext == null)
        {
            return;
        }

        try
        {
            await ResolveFromHttpContextAsync(context, httpContext);
        }
        catch (Exception e)
        {
            context.ServiceProvider
                .GetRequiredService<ILogger<HttpDataPermissionResolveContributorBase>>()
                .LogWarning(e.ToString());
        }
    }

    protected virtual async Task ResolveFromHttpContextAsync(IDataPermissionResolveContext context, HttpContext httpContext)
    {
        var (code, dataPermission) = await GetDataPermissionFromHttpContextOrNullAsync(context, httpContext);
        if (dataPermission != null)
        {
            context.DataPermissionCode = code;
            context.DataPermission = dataPermission;
        }
    }

    protected abstract Task<(string?, Panda.DataPermission.Abstractions.DataPermission.DataPermission?)> GetDataPermissionFromHttpContextOrNullAsync(IDataPermissionResolveContext context, HttpContext httpContext);
}