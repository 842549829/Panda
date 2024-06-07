namespace Panda.AspNetCore.DataPermission;

public static class PandaAspNetCoreDataPermissionApplicationBuilderExtensions
{
    public static IApplicationBuilder UseMultiTenancy(this IApplicationBuilder app)
    {
        return app
            .UseMiddleware<DataPermissionMiddleware>();
    }
}