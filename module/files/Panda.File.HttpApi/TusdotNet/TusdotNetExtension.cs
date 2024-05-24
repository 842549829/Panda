
using Microsoft.Extensions.DependencyInjection;
using tusdotnet.Models.Expiration;
using tusdotnet.Models;
using tusdotnet.Stores;

namespace Panda.File.HttpApi.TusdotNet;

public static class TusdotNetExtension
{
    public static DefaultTusConfiguration CreateTusConfigurationForCleanupService(this IServiceProvider services)
    {
        var path = services.GetRequiredService<TusDiskStorageOptionHelper>().StorageDiskPath;

        // Simplified configuration just for the ExpiredFilesCleanupService to show load order of configs.
        return new DefaultTusConfiguration
        {
            Store = new TusDiskStore(path),
            Expiration = new AbsoluteExpiration(TimeSpan.FromMinutes(5))
        };
    }
}