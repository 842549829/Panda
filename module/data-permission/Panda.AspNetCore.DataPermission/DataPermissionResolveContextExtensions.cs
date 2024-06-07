using Microsoft.Extensions.Options;
using Panda.DataPermission.Abstractions.DataPermission;

namespace Panda.AspNetCore.DataPermission;

public static class DataPermissionResolveContextExtensions
{
    public static PandaAspNetCoreDataPermissionOptions GetPandaAspDataPermissionOptions(
        this IDataPermissionResolveContext context)
    {
        return context.ServiceProvider.GetRequiredService<IOptions<PandaAspNetCoreDataPermissionOptions>>().Value;
    }

    public static Panda.DataPermission.Abstractions.DataPermission.DataPermission? ToDataPermission(
        this string dataPermission)
    {
        return int.TryParse(dataPermission, out var code)
            ? (Panda.DataPermission.Abstractions.DataPermission.DataPermission)code
            : null;
    }
}