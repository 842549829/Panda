using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Logging.Abstractions;
using Panda.DataPermission.Abstractions.DataPermission;
using Volo.Abp;
using Volo.Abp.AspNetCore.Middleware;
using Volo.Abp.DependencyInjection;

namespace Panda.AspNetCore.DataPermission;

public class DataPermissionMiddleware : AbpMiddlewareBase, ITransientDependency
{
    private readonly IDataPermissionResolver _dataPermissionResolver;
    private readonly ICurrentDataPermission _currentDataPermission;
    public ILogger<DataPermissionMiddleware> Logger { get; set; }

    public DataPermissionMiddleware(
        IDataPermissionResolver dataPermissionResolver,
        ICurrentDataPermission currentDataPermission)
    {
        _currentDataPermission = Check.NotNull(currentDataPermission, nameof(currentDataPermission));

        _dataPermissionResolver = dataPermissionResolver;
        _currentDataPermission = currentDataPermission;
        Logger = NullLogger<DataPermissionMiddleware>.Instance;
    }

    public override async Task InvokeAsync(HttpContext context, RequestDelegate next)
    {
        DataPermissionResolveResult? dataPermissionResolveResult = null;
        try
        {
            dataPermissionResolveResult = await _dataPermissionResolver.ResolveDataPermissionAsync();
        }
        catch (Exception e)
        {
            Logger.LogException(e);
        }

        if (dataPermissionResolveResult?.DataPermission != _currentDataPermission.DataPermission)
        {
            using (_currentDataPermission.Change(dataPermissionResolveResult?.DataPermissionCode,
                       dataPermissionResolveResult?.DataPermission))
            {
                await next(context);
            }
        }
        else
        {
            await next(context);
        }
    }
}