using System;
using System.Threading.Tasks;
using Volo.Abp.SettingManagement;

namespace Panda.Net.Bases.Settings;

public class SettingAppService : NetAppService, ISettingAppService
{
    private readonly ISettingManager settingManager;

    public SettingAppService(ISettingManager settingManager)
    {
        this.settingManager = settingManager;
    }

    public async Task SetAsync()
    {
        await settingManager.SetGlobalAsync("Smtp.Host", "localhost");
        await settingManager.SetGlobalAsync("Smtp.UserName", "15684132655@gmail.com");
        await settingManager.SetGlobalAsync("Smtp.Port", "1544");
        await settingManager.SetGlobalAsync("Smtp.Password", "123456");
        await settingManager.SetGlobalAsync("Smtp.EnableSsl", "false");
    }
}