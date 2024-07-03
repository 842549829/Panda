using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Panda.Net.Bases.Users;
using Panda.Net.Bases.Users.Dtos;
using System.Threading.Tasks;
using Volo.Abp.Settings;

namespace Panda.Net.Controllers.Bases;

[Route("api/basics/accounts")]
[ApiController]
[AllowAnonymous]
public class AccountController : NetController
{
    private readonly IAccountAppService _accountAppService;

    public AccountController(IAccountAppService accountAppService)
    {
        _accountAppService = accountAppService;
    }

    [HttpPost("login")]
    public async Task<ActionResult<LoginResultDto>> LoginAsync(LoginInputDto input)
    {
        // 本地化显示测试
        //var d1 = L.DisplayValue("L:Net,DisplayName:Edit");

        // 本地配置测试
        //var settingProvider = LazyServiceProvider.LazyGetRequiredService<ISettingProvider>();
        //var userName1 = await settingProvider.GetOrNullAsync("Smtp.Host");
        //var userName2 = await settingProvider.GetOrNullAsync("Smtp.Password");
        //var userName3 = await settingProvider.GetOrNullAsync("Smtp.EnableSsl");
        //var userName4 = await settingProvider.GetOrNullAsync("Smtp.UserName");

        //if (!await CheckCode(input.VerificationCode))
        //{
        //    throw new UserFriendlyException("验证码错误");
        //}
        return await _accountAppService.LoginAsync(input);
    }

    [HttpPost("refresh")]
    public async Task<ActionResult<LoginResultDto>> RefreshAsync(RefreshTokenInputDto input)
    {
        return await _accountAppService.RefreshAsync(input);
    }
}