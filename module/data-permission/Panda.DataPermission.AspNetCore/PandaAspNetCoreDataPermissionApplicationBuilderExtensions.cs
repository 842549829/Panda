namespace Panda.DataPermission.AspNetCore;

public static class PandaAspNetCoreDataPermissionApplicationBuilderExtensions
{
    public static IApplicationBuilder UseDataPermission(this IApplicationBuilder app)
    {
        return app
            .UseMiddleware<DataPermissionMiddleware>();
    }
}