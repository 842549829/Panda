using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using OpenIddict.Abstractions;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.IdentityModel.JsonWebTokens;
using Volo.Abp.Data;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Identity;
using Volo.Abp.OpenIddict;
using Volo.Abp.Security.Claims;

namespace Panda.Net.ExtensionGrantTypes;

public class UnifiedClaimsPrincipalExtension : IAbpOpenIddictClaimsPrincipalHandler, ITransientDependency
{
    public async Task HandleAsync(AbpOpenIddictClaimsPrincipalHandlerContext context)
    {
        var userManager = context.ScopeServiceProvider.GetRequiredService<IdentityUserManager>();
        var user = await userManager.GetUserAsync(context.Principal);
        if (user != null)
        {
            var identities = context.Principal.Identities.First();
            const string type = "openId";
            var value = user.GetProperty<string>("OpenId") ?? string.Empty;

            if (!identities.HasClaim("openid", value))
            {
                identities.AddClaim(new Claim(type, value));
            }
        }
    }
}

[Dependency(ReplaceServices = true)]
public class NetDefaultOpenIddictClaimsPrincipalHandler : IAbpOpenIddictClaimsPrincipalHandler, ITransientDependency
{
    public virtual Task HandleAsync(AbpOpenIddictClaimsPrincipalHandlerContext context)
    {
        var securityStampClaimType = context
            .ScopeServiceProvider
            .GetRequiredService<IOptions<IdentityOptions>>().Value
            .ClaimsIdentity.SecurityStampClaimType;

        foreach (var claim in context.Principal.Claims)
        {
            if (claim.Type == AbpClaimTypes.TenantId)
            {
                claim.SetDestinations(OpenIddictConstants.Destinations.AccessToken, OpenIddictConstants.Destinations.IdentityToken);
                continue;
            }

            switch (claim.Type)
            {
                case OpenIddictConstants.Claims.PreferredUsername:
                    claim.SetDestinations(OpenIddictConstants.Destinations.AccessToken);
                    if (context.Principal.HasScope(OpenIddictConstants.Scopes.Profile))
                    {
                        claim.SetDestinations(OpenIddictConstants.Destinations.AccessToken, OpenIddictConstants.Destinations.IdentityToken);
                    }
                    break;

                case JwtRegisteredClaimNames.UniqueName:
                    claim.SetDestinations(OpenIddictConstants.Destinations.AccessToken);
                    if (context.Principal.HasScope(OpenIddictConstants.Scopes.Profile))
                    {
                        claim.SetDestinations(OpenIddictConstants.Destinations.AccessToken, OpenIddictConstants.Destinations.IdentityToken);
                    }
                    break;

                case OpenIddictConstants.Claims.Email:
                    claim.SetDestinations(OpenIddictConstants.Destinations.AccessToken);
                    if (context.Principal.HasScope(OpenIddictConstants.Scopes.Email))
                    {
                        claim.SetDestinations(OpenIddictConstants.Destinations.AccessToken, OpenIddictConstants.Destinations.IdentityToken);
                    }
                    break;

                case OpenIddictConstants.Claims.Role:
                    claim.SetDestinations(OpenIddictConstants.Destinations.AccessToken);
                    if (context.Principal.HasScope(OpenIddictConstants.Scopes.Roles))
                    {
                        claim.SetDestinations(OpenIddictConstants.Destinations.AccessToken, OpenIddictConstants.Destinations.IdentityToken);
                    }
                    break;

                default:
                    // Never include the security stamp in the access and identity tokens, as it's a secret value.
                    if (claim.Type != securityStampClaimType)
                    {
                        claim.SetDestinations(OpenIddictConstants.Destinations.AccessToken);
                    }
                    break;
            }
        }

        return Task.CompletedTask;
    }
}