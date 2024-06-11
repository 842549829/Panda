using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.DependencyInjection;
using Panda.Messaging.Application;
using Panda.Net.Bases.Announcements;
using Panda.Net.Bases.Announcements.Dtos;
using Panda.Net.Options;
using System;
using Panda.Net.Bases.Announcements.Entities;
using Panda.Net.Enums;
using Volo.Abp.Account;
using Volo.Abp.AutoMapper;
using Volo.Abp.FeatureManagement;
using Volo.Abp.FluentValidation;
using Volo.Abp.Identity;
using Volo.Abp.Modularity;
using Volo.Abp.PermissionManagement;
using Volo.Abp.SettingManagement;
using Volo.Abp.TenantManagement;
using Microsoft.Extensions.Configuration;

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

        // 配置自动映射
        //Configure<AbpAutoMapperOptions>(options =>
        //{
        //    options.Configurators.Add(configurationContext =>
        //    {
        //        var address = configurationContext.ServiceProvider.GetRequiredService<IConfiguration>()["App:CorsOrigins"];
        //        configurationContext.MapperConfiguration
        //            .CreateMap<Announcement, AnnouncementDto>().ForMember(d => d.Content,
        //                s => s.MapFrom(c => address + c.Content));
        //    });
        //});
    }
}