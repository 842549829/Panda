public class CookieDataPermissionResolveContributor : HttpDataPermissionResolveContributorBase
    {
        public const string ContributorName = "Cookie";

        /// <summary>
        /// 参与者名称
        /// </summary>
        public override string Name => ContributorName;


        protected override Task<(string?, Panda.DataPermission.Abstractions.DataPermission.DataPermission?)> GetDataPermissionFromHttpContextOrNullAsync(IDataPermissionResolveContext context, HttpContext httpContext)
        {
            return null;
            //return Task.FromResult(httpContext.Request.Cookies[context.GetAbpAspNetCoreMultiTenancyOptions().TenantKey]);
        }
    }