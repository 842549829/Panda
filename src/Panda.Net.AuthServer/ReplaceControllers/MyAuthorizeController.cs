using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Primitives;
using OpenIddict.Abstractions;
using OpenIddict.Server.AspNetCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Volo.Abp.AspNetCore.Controllers;
using Volo.Abp.AspNetCore.Security;
using Volo.Abp.OpenIddict;
using Volo.Abp.OpenIddict.Controllers;
using Volo.Abp.OpenIddict.ViewModels.Authorization;
using Volo.Abp.Security.Claims;

namespace Panda.Net.ReplaceControllers;


[ReplaceControllers(typeof(AuthorizeController))]
[Route("connect/authorize")]
[ApiExplorerSettings(IgnoreApi = false)]
public class MyAuthorizeController : AuthorizeController
{
    [HttpGet, HttpPost]
    [IgnoreAntiforgeryToken]
    [IgnoreAbpSecurityHeader]
    public override async Task<IActionResult> HandleAsync()
    {
        return await base.HandleAsync();
    }

    [HttpPost]
    [Authorize]
    [Route("callback")]
    public override async Task<IActionResult> HandleCallbackAsync()
    {
        return await base.HandleCallbackAsync();
    }
}

[ReplaceControllers(typeof(TokenController))]
[Route("connect/token")]
[ApiExplorerSettings(IgnoreApi = false)]
public class MyTokenController : TokenController
{
    [HttpGet]
    [HttpPost]
    [Produces("application/json", [])]
    public override async Task<IActionResult> HandleAsync()
    {
        return await base.HandleAsync();
    }
}