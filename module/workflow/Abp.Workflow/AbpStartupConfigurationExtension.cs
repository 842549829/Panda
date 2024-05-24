using Microsoft.Extensions.DependencyInjection;

namespace Abp.Workflow;

public static class AbpStartupConfigurationExtension
{
    public static IServiceCollection AddAbpStepBodyConfiguration(this IServiceCollection service)
    {
        service.AddSingleton<IAbpStepBodyConfiguration, AbpStepBodyConfiguration>();
        return service;
    }
}