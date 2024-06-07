using Panda.DataPermission.Abstractions.DataPermission;

namespace Panda.AspNetCore.DataPermission;

public class QueryStringDataPermissionResolveContributor : HttpDataPermissionResolveContributorBase
{
    public const string ContributorName = "QueryString";

    public override string Name => ContributorName;

    protected override Task<(string?, Panda.DataPermission.Abstractions.DataPermission.DataPermission?)>
        GetDataPermissionFromHttpContextOrNullAsync(IDataPermissionResolveContext context, HttpContext httpContext)
    {
        if (httpContext.Request.QueryString.HasValue)
        {
            var dataPermissionCodeKey = context.GetPandaAspDataPermissionOptions().DataPermissionCodeKey;
            var dataPermissionKey = context.GetPandaAspDataPermissionOptions().DataPermissionKey;
            if (httpContext.Request.Query.ContainsKey(dataPermissionKey))
            {
                var dataPermissionValue = httpContext.Request.Query[dataPermissionKey].ToString();
                httpContext.Request.Query.TryGetValue(dataPermissionCodeKey, out var dataPermissionCodeValue);
                var dataPermissionCode = dataPermissionCodeValue == string.Empty || dataPermissionCodeValue.Count < 1
                    ? null
                    : dataPermissionCodeValue.ToString();
                if (dataPermissionValue.IsNullOrWhiteSpace())
                {
                    context.Handled = true;
                    return Task.FromResult<(string?, Panda.DataPermission.Abstractions.DataPermission.DataPermission?)>(
                        (null, null));
                }

                return Task.FromResult((dataPermissionCode, dataPermissionValue.ToDataPermission()));
            }
        }

        return Task.FromResult<(string?, Panda.DataPermission.Abstractions.DataPermission.DataPermission?)>(
            (null, null));
    }
}