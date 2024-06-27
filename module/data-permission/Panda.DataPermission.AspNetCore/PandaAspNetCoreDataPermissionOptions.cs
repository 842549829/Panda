using Panda.DataPermission.Abstractions.DataPermission;

namespace Panda.DataPermission.AspNetCore;

public class PandaAspNetCoreDataPermissionOptions
{
    public string DataPermissionCodeKey { get; }

    public string DataPermissionKey { get; }
    
   // public Func<HttpContext, Exception, Task<bool>> DataPermissionMiddlewareErrorPageBuilder { get; set; }
    
    
    public PandaAspNetCoreDataPermissionOptions()
    {
        DataPermissionCodeKey = DataPermissionResolverConsts.DefaultDataPermissionCodeKey;
        DataPermissionKey = DataPermissionResolverConsts.DefaultDataPermissionKey;

        // DataPermissionMiddlewareErrorPageBuilder = async (context, exception) =>
        // {
        //     var isCookieAuthentication = false;
        //     await context.Response.WriteAsync(exception.ToString());
        //     return true;
        // };
    }
}