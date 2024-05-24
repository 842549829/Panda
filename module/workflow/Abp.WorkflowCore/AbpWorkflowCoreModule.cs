using Abp.Workflow;
using Microsoft.Extensions.DependencyInjection;
using Volo.Abp;
using Volo.Abp.Modularity;
using WorkflowCore.Interface;

namespace Abp.WorkflowCore;

[DependsOn(typeof(AbpWorkflowModule))]
public class AbpWorkflowCoreModule : AbpModule
{
    /*
     * 依次按下面的顺序执行
     */
    public override void PreConfigureServices(ServiceConfigurationContext context)
    {
        base.PreConfigureServices(context);
    }

    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        base.ConfigureServices(context);
    }

    public override void PostConfigureServices(ServiceConfigurationContext context)
    {
        base.PostConfigureServices(context);
    }

    public override void OnPreApplicationInitialization(ApplicationInitializationContext context)
    {
        base.OnPreApplicationInitialization(context);
    }

    public override void OnApplicationInitialization(ApplicationInitializationContext context)
    {
        base.OnApplicationInitialization(context);
    }

    public override void OnPostApplicationInitialization(ApplicationInitializationContext context)
    {
        base.OnPostApplicationInitialization(context);
        // 程序启动后再初始化
        var host = context.ServiceProvider.GetRequiredService<IWorkflowHost>();
        host.Start();
    }

    public override async Task OnPostApplicationInitializationAsync(ApplicationInitializationContext context)
    {
        await base.OnPostApplicationInitializationAsync(context);
        // 初始化流程
        var workflowManager = context.ServiceProvider.GetRequiredService<AbpWorkflowManager>();
        await workflowManager.Initialize();
    }

    public override void OnApplicationShutdown(ApplicationShutdownContext context)
    {
        base.OnApplicationShutdown(context);

        // 程序结束则停止
        var host = context.ServiceProvider.GetRequiredService<IWorkflowHost>();
        host.Stop();
    }
}