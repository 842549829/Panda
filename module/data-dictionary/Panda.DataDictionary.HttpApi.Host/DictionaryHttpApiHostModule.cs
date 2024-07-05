using Panda.DataDictionary.Application;
using Panda.DataDictionary.Application.Contracts;
using Panda.DataDictionary.Domain;
using Panda.DataDictionary.Domain.Shared;
using Panda.DataDictionary.EntityFrameworkCore;
using Panda.DataPermission.AspNetCore;
using Panda.HttpApi.Host;
using Panda.HttpApi.Host.Configurations;
using Volo.Abp;
using Volo.Abp.AspNetCore.Mvc.AntiForgery;
using Volo.Abp.Caching;
using Volo.Abp.Modularity;
using Volo.Abp.VirtualFileSystem;

namespace Panda.DataDictionary.HttpApi.Host;

[DependsOn(
    typeof(DictionaryHttpApiModule),
    typeof(DictionaryApplicationModule),
    typeof(DictionaryEntityFrameworkCoreModule),
    typeof(PandaHttpApiHostModule)
)]
public class DictionaryHttpApiHostModule : AbpModule
{
    private const string DefaultCorsPolicyName = "Default";

    private const string ApplicationName = "DataDictionary";

    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        var configuration = context.Services.GetConfiguration();
        var hostingEnvironment = context.Services.GetHostingEnvironment();

        context.ConfigureAuthentication(configuration);
        ConfigureCache();
        ConfigureVirtualFileSystem(context);
        context.ConfigureDataProtection(configuration, hostingEnvironment, ApplicationName);
        context.ConfigureDistributedLocking(configuration);
        context.ConfigureCors(DefaultCorsPolicyName);
        context.ConfigureSwaggerServices(configuration, ApplicationName);

        // 关闭防伪造验证
        Configure<AbpAntiForgeryOptions>(options =>
        {
            options.AutoValidate = false;
        });
    }

    private void ConfigureCache()
    {
        Configure<AbpDistributedCacheOptions>(options => { options.KeyPrefix = "Files:"; });
    }

    private void ConfigureVirtualFileSystem(ServiceConfigurationContext context)
    {
        var hostingEnvironment = context.Services.GetHostingEnvironment();

        if (hostingEnvironment.IsDevelopment())
        {
            Configure<AbpVirtualFileSystemOptions>(options =>
            {
                options.FileSets.ReplaceEmbeddedByPhysical<DictionaryDomainSharedModule>(
                    Path.Combine(hostingEnvironment.ContentRootPath,
                        $"..{Path.DirectorySeparatorChar}Panda.DataDictionary.Domain.Shared"));
                options.FileSets.ReplaceEmbeddedByPhysical<DictionaryDomainModule>(
                    Path.Combine(hostingEnvironment.ContentRootPath,
                        $"..{Path.DirectorySeparatorChar}Panda.DataDictionary.Domain"));
                options.FileSets.ReplaceEmbeddedByPhysical<DictionaryApplicationContractsModule>(
                    Path.Combine(hostingEnvironment.ContentRootPath,
                        $"..{Path.DirectorySeparatorChar}Panda.DataDictionary.Application.Contracts"));
                options.FileSets.ReplaceEmbeddedByPhysical<DictionaryApplicationModule>(
                    Path.Combine(hostingEnvironment.ContentRootPath,
                        $"..{Path.DirectorySeparatorChar}Panda.DataDictionary.Application"));
            });
        }
    }

    public override void OnApplicationInitialization(ApplicationInitializationContext context)
    {
        var app = context.GetApplicationBuilder();
        var env = context.GetEnvironment();

        if (env.IsDevelopment())
        {
            app.UseDeveloperExceptionPage();
        }
        app.UseDefaultFiles();
        app.UseAbpRequestLocalization();
        app.UseCorrelationId();
        app.UseStaticFiles();
        app.UseRouting();
        app.UseCors(DefaultCorsPolicyName);
        app.UseAuthentication();

        app.UseMultiTenancy();
        app.UseDataPermission();

        app.UseAuthorization();

        app.UseSwagger();
        app.UseAbpSwaggerUI(options =>
        {
            options.SwaggerEndpoint("/swagger/v1/swagger.json", "DataDictionary API");
        });

        app.UseAuditing();
        app.UseAbpSerilogEnrichers();
        app.UseUnitOfWork();
        app.UseConfiguredEndpoints();
    }
}