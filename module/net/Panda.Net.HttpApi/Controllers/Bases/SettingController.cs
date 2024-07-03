using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Panda.Net.Bases.Settings;
using Panda.Net.Bases.Users.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Settings;

namespace Panda.Net.Controllers.Bases;

[Route("api/basics/settings")]
[ApiController]
[AllowAnonymous]
public class SettingController : NetController
{

    [HttpPost("set")]
    public async Task<string> SetAsync()
    {
        var settingAppService = LazyServiceProvider.LazyGetRequiredService<ISettingAppService>();
        await settingAppService.SetAsync();
        // 本地配置测试
        var settingProvider = LazyServiceProvider.LazyGetRequiredService<ISettingProvider>();
        var userName1 = await settingProvider.GetOrNullAsync("Smtp.Host");
        var userName11 = await settingProvider.GetOrNullAsync("Smtp.UserName");
        var userName2 = await settingProvider.GetAsync<int>("Smtp.Port");
        var userName3 = await settingProvider.GetOrNullAsync("Smtp.Password");
        var userName4 = await settingProvider.IsTrueAsync("Smtp.EnableSsl");
        return "OK";
    }
}