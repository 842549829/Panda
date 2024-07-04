using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Panda.DbMigrator;
using Serilog;
using Serilog.Events;

namespace Panda.DataDictionary.DbMigrator;

internal class Program
{
    private static async Task Main(string[] args)
    {
        Log.Logger = new LoggerConfiguration()
            .MinimumLevel.Information()
            .MinimumLevel.Override("Microsoft", LogEventLevel.Warning)
            .MinimumLevel.Override("Volo.Abp", LogEventLevel.Warning)
#if DEBUG
            .MinimumLevel.Override("Panda.DataDictionary", LogEventLevel.Debug)
#else
                .MinimumLevel.Override("Panda.DataDictionary", LogEventLevel.Information)
#endif
            .Enrich.FromLogContext()
            .WriteTo.Async(c => c.File($"{AppContext.BaseDirectory}logs/logs.log", rollingInterval: RollingInterval.Day))
            .WriteTo.Async(c => c.Console())
            .CreateLogger();

        await CreateHostBuilder(args).RunConsoleAsync();
    }

    public static IHostBuilder CreateHostBuilder(string[] args) =>
        Host.CreateDefaultBuilder(args)
            .AddAppSettingsSecretsJson()
            .ConfigureLogging((_, logging) => logging.ClearProviders())
            .ConfigureServices((_, services) =>
            {
                services.AddHostedService<PandaDbMigratorHostedService<DataDictionaryDbMigratorModule>>();
            });
}