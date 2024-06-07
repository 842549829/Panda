using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using Panda.DataPermission.Abstractions.DataPermission;
using Volo.Abp.DependencyInjection;

namespace Panda.DataPermission;

public class DataPermissionResolver : IDataPermissionResolver, ITransientDependency
{
    private readonly IServiceProvider _serviceProvider;
    private readonly PandaAspDataPermissionResolveOptions _options;

    public DataPermissionResolver(IOptions<PandaAspDataPermissionResolveOptions> options, IServiceProvider serviceProvider)
    {
        _serviceProvider = serviceProvider;
        _options = options.Value;
    }
    
    public async Task<DataPermissionResolveResult> ResolveDataPermissionAsync()
    {
        var result = new DataPermissionResolveResult();

        using (var serviceScope = _serviceProvider.CreateScope())
        {
            var context = new DataPermissionResolveContext(serviceScope.ServiceProvider);

            foreach (var tenantResolver in _options.DataPermissionResolves)
            {
                await tenantResolver.ResolveAsync(context);

                result.AppliedResolvers.Add(tenantResolver.Name);

                if (context.HasResolvedDataPermission())
                {
                    result.DataPermission = context.DataPermission;
                    result.DataPermissionCode = context.DataPermissionCode;
                    break;
                }
            }
        }

        return result;
    }
}