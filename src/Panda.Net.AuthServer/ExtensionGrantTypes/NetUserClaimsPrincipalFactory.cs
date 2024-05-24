using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Options;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Volo.Abp.Data;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Identity;
using Volo.Abp.Security.Claims;
using Volo.Abp.Uow;
using IdentityRole = Volo.Abp.Identity.IdentityRole;
using IdentityUser = Volo.Abp.Identity.IdentityUser;

namespace Panda.Net.ExtensionGrantTypes;

/// <summary>
/// 自定义Claim
/// </summary>
public class NetUserClaimsPrincipalFactory:AbpUserClaimsPrincipalFactory, ITransientDependency
{
    public NetUserClaimsPrincipalFactory(UserManager<IdentityUser> userManager,
        RoleManager<IdentityRole> roleManager, 
        IOptions<IdentityOptions> options, 
        ICurrentPrincipalAccessor currentPrincipalAccessor,
        IAbpClaimsPrincipalFactory abpClaimsPrincipalFactory) :
        base(userManager, 
            roleManager, 
            options, 
            currentPrincipalAccessor, 
            abpClaimsPrincipalFactory)
    {
    }

    [UnitOfWork]
    public override async Task<ClaimsPrincipal> CreateAsync(Volo.Abp.Identity.IdentityUser user)
    {
        var principal = await base.CreateAsync(user);

        principal.Identities
            .First().AddClaim(new Claim("openId", user.GetProperty<string>("OpenId") ?? string.Empty));
        return principal;
    }
}