using System.Collections.Generic;
using Volo.Abp.SettingManagement;
using Volo.Abp.Settings;

namespace Panda.Net.Settings;

public class NetSettingDefinitionProvider : SettingDefinitionProvider
{
    private readonly ISettingManager settingManager;

    public NetSettingDefinitionProvider(ISettingManager settingManager)
    {
        this.settingManager = settingManager;
    }

    public override void Define(ISettingDefinitionContext context)
    {
        //Define your own settings here. Example:
        //context.Add(new SettingDefinition(NetSettings.MySetting1, "Test1"));

        context.Add(
           new SettingDefinition("Smtp.Host", "127.0.0.1"),
           new SettingDefinition("Smtp.Port", "25"),
           new SettingDefinition("Smtp.UserName"),
           new SettingDefinition("Smtp.Password", isEncrypted: true),
           new SettingDefinition("Smtp.EnableSsl")
       );

        // settingManager.SetGlobalAsync("Smtp.Password", "123456");
    }
}

