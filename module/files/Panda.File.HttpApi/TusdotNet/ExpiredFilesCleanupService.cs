using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using tusdotnet.Interfaces;
using tusdotnet.Models.Expiration;
using tusdotnet.Models;

namespace Panda.File.HttpApi.TusdotNet;

public sealed class ExpiredFilesCleanupService(ILogger<ExpiredFilesCleanupService> logger,
        DefaultTusConfiguration config)
    : IHostedService, IDisposable
{
    private readonly ITusExpirationStore _expirationStore = (ITusExpirationStore)config.Store;
    private readonly ExpirationBase _expiration = config.Expiration;
    private Timer? _timer;

    public async Task StartAsync(CancellationToken cancellationToken)
    {
        await RunCleanup(cancellationToken);
        _timer = new Timer(Callback, cancellationToken, TimeSpan.Zero, _expiration.Timeout);
    }

    private async void Callback(object? e)
    {
        await RunCleanup((CancellationToken)e!);
    }

    public Task StopAsync(CancellationToken cancellationToken)
    {
        _ = (_timer?.Change(Timeout.Infinite, 0));
        return Task.CompletedTask;
    }

    public void Dispose()
    {
        _timer?.Dispose();
    }

    private async Task RunCleanup(CancellationToken cancellationToken)
    {
        try
        {
            logger.LogInformation("Running cleanup job...");
            var numberOfRemovedFiles = await _expirationStore.RemoveExpiredFilesAsync(cancellationToken);
            logger.LogInformation($"Removed {numberOfRemovedFiles} expired files. Scheduled to run again in {_expiration.Timeout.TotalMilliseconds} ms");
        }
        catch (Exception exc)
        {
            logger.LogWarning("Failed to run cleanup job: " + exc.Message);
        }
    }
}