using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.DependencyInjection;
using Panda.Messaging.Application;
using Panda.Net.Options;
using System;
using Volo.Abp.Account;
using Volo.Abp.AutoMapper;
using Volo.Abp.FeatureManagement;
using Volo.Abp.FluentValidation;
using Volo.Abp.Identity;
using Volo.Abp.Modularity;
using Volo.Abp.PermissionManagement;
using Volo.Abp.SettingManagement;
using Volo.Abp.TenantManagement;

namespace Panda.Net;

[DependsOn(
    typeof(NetDomainModule),
    typeof(AbpAccountApplicationModule),
    typeof(NetApplicationContractsModule),
    typeof(AbpIdentityApplicationModule),
    typeof(AbpPermissionManagementApplicationModule),
    typeof(AbpTenantManagementApplicationModule),
    typeof(AbpFeatureManagementApplicationModule),
    typeof(AbpSettingManagementApplicationModule),
    typeof(AbpFluentValidationModule),
    typeof(MessageApplicationModule)
    )]
public class NetApplicationModule : AbpModule
{
    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        var configuration = context.Services.GetConfiguration();
        var services = context.Services;

        Configure<AbpAutoMapperOptions>(options =>
        {
            options.AddMaps<NetApplicationModule>();
        });

        Configure<IdentityOptions>(options =>
        {
            // 配置密码规则
            //options.Password.RequireUppercase = false;
            //options.Password.RequireLowercase = false;

            // 配置用户登录失败连错误20次则锁定帐号10分钟
            options.Lockout.MaxFailedAccessAttempts = 20;
            options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(10.0);
        });

        // 授权信息配置
        Configure<AuthServerOptions>(configuration.GetSection("AuthServer"));

        // 注册网络请求
        services.AddHttpClient();
    }
}