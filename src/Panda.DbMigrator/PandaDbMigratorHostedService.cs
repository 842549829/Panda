using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Panda.DbMigrator.Data;
using Serilog;
using Volo.Abp;
using Volo.Abp.Data;
using Volo.Abp.Modularity;

namespace Panda.DbMigrator;

public class PandaDbMigratorHostedService<TModule> : IHostedService
    where TModule : AbpModule
{
    private readonly IHostApplicationLifetime _hostApplicationLifetime;
    private readonly IConfiguration _configuration;

    public PandaDbMigratorHostedService(IHostApplicationLifetime hostApplicationLifetime, IConfiguration configuration)
    {
        _hostApplicationLifetime = hostApplicationLifetime;
        _configuration = configuration;
    }

    public async Task StartAsync(CancellationToken cancellationToken)
    {
        using (var application = await AbpApplicationFactory.CreateAsync<TModule>(options =>
               {
                   options.Services.ReplaceConfiguration(_configuration);
                   options.UseAutofac();
                   options.Services.AddLogging(c => c.AddSerilog());
                   options.AddDataMigrationEnvironment();
               }))
        {
            await application.InitializeAsync();

            await application
                .ServiceProvider
                .GetRequiredService<IPandaDbMigrationService>()
                .MigrateAsync();

            await application.ShutdownAsync();

            _hostApplicationLifetime.StopApplication();
        }
    }

    public Task StopAsync(CancellationToken cancellationToken)
    {
        return Task.CompletedTask;
    }
}