using Panda.DataPermission.Abstractions.DataPermission;

namespace Panda.AspNetCore.DataPermission;

public class HeaderDataPermissionResolveContributor : HttpDataPermissionResolveContributorBase
{
    public const string ContributorName = "Header";

    /// <summary>
    /// 参与者名称
    /// </summary>
    public override string Name => ContributorName;

    protected override Task<(string?, Panda.DataPermission.Abstractions.DataPermission.DataPermission?)>
        GetDataPermissionFromHttpContextOrNullAsync(IDataPermissionResolveContext context, HttpContext httpContext)
    {
        if (httpContext.Request.Headers.IsNullOrEmpty())
        {
            return Task.FromResult(((string?)null,
                (Panda.DataPermission.Abstractions.DataPermission.DataPermission?)null));
        }

        var dataPermissionCodeKey = context.GetPandaAspDataPermissionOptions().DataPermissionCodeKey;
        var dataPermissionKey = context.GetPandaAspDataPermissionOptions().DataPermissionKey;
        var dataPermissionCode = httpContext.Request.Headers[dataPermissionCodeKey];
        var dataPermission = httpContext.Request.Headers[dataPermissionKey];
        if (dataPermission == string.Empty || dataPermission.Count < 1)
        {
            return Task.FromResult(((string?)null,
                (Panda.DataPermission.Abstractions.DataPermission.DataPermission?)null));
        }

        if (dataPermission.Count > 1)
        {
            Log(context,
                $"HTTP request includes more than one {dataPermissionKey} header value. First one will be used. All of them: {dataPermission.JoinAsString(", ")}, code: {dataPermissionCode}");
        }
        var code = dataPermissionCode == string.Empty || dataPermissionCode.Count < 1
            ? null
            : dataPermissionCode.ToString();
        return Task.FromResult((code, dataPermission.ToString().ToDataPermission()));
    }

    protected virtual void Log(IDataPermissionResolveContext context, string text)
    {
        context
            .ServiceProvider
            .GetRequiredService<ILogger<HeaderDataPermissionResolveContributor>>()
            .LogWarning(text);
    }
}