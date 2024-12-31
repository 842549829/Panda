using Microsoft.Extensions.DependencyInjection;
using WorkflowCore.Interface;

namespace WorkflowCore.Services
{
    /// <summary>
    /// A concrete implementation for the IScopeProvider interface
    /// Largely to get around the problems of unit testing an extension method (CreateScope())
    /// </summary>
    public class ScopeProvider : IScopeProvider
    {
        private readonly IServiceScopeFactory provider;

        public ScopeProvider(IServiceScopeFactory provider)
        {
            this.provider = provider;
        }

        public IServiceScope CreateScope()
        {
            return provider.CreateScope();
        }
    }
}
