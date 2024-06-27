using Microsoft.Extensions.DependencyInjection;
using WorkflowCore.DSL.Interface;
using WorkflowCore.DSL.Services;

namespace WorkflowCore.DSL
{
    public static class ServiceCollectionExtensions
    {
        public static IServiceCollection AddWorkflowDSL(this IServiceCollection services)
        {
            services.AddTransient<IDefinitionLoader, DefinitionLoader>();
            return services;
        }
    }
}

