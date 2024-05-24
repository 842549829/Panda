using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using System.IO;
using System.IO.Pipes;
using System.Text;
using tusdotnet.Interfaces;
using tusdotnet.Models;
using tusdotnet.Models.Concatenation;
using tusdotnet.Models.Configuration;
using tusdotnet.Models.Expiration;
using tusdotnet.Stores;

namespace Panda.File.HttpApi.TusdotNet;

public class UploadFileTusConfiguration
{
    public static Task<DefaultTusConfiguration> TusConfigurationFactory(HttpContext httpContext)
    {
        var logger = httpContext.RequestServices.GetRequiredService<ILoggerFactory>().CreateLogger<UploadFileTusConfiguration>();

        // Change the value of EnableOnAuthorize in appsettings.json to enable or disable
        // the new authorization event.
        //var enableAuthorize = httpContext.RequestServices.GetRequiredService<IOptions<OnAuthorizeOption>>().Value.EnableOnAuthorize;

        var diskStorePath = httpContext.RequestServices.GetRequiredService<TusDiskStorageOptionHelper>().StorageDiskPath;

        var config = new DefaultTusConfiguration
        {
            Store = new TusDiskStore(diskStorePath),
            MetadataParsingStrategy = MetadataParsingStrategy.AllowEmptyValues,
            UsePipelinesIfAvailable = true,
            Events = new Events
            {
                OnAuthorizeAsync = ctx =>
                {
                    // Note: This event is called even if RequireAuthorization is called on the endpoint.
                    // In that case this event is not required but can be used as fine-grained authorization control.
                    // This event can also be used as a "on request started" event to prefetch data or similar.

                    //if (!enableAuthorize)
                    //    return Task.CompletedTask;

                    //if (ctx.HttpContext.User.Identity?.IsAuthenticated != true)
                    //{
                    //    ctx.HttpContext.Response.Headers.Add("WWW-Authenticate", new StringValues("Basic realm=tusdotnet-test-net6.0"));
                    //    ctx.FailRequest(HttpStatusCode.Unauthorized);
                    //    return Task.CompletedTask;
                    //}

                    //if (ctx.HttpContext.User.Identity.Name != "test")
                    //{
                    //    ctx.FailRequest(HttpStatusCode.Forbidden, "'test' is the only allowed user");
                    //    return Task.CompletedTask;
                    //}

                    // Do other verification on the user; claims, roles, etc.

                    // Verify different things depending on the intent of the request.
                    // E.g.:
                    //   Does the file about to be written belong to this user?
                    //   Is the current user allowed to create new files or have they reached their quota?
                    //   etc etc
                    switch (ctx.Intent)
                    {
                        case IntentType.CreateFile:
                            break;
                        case IntentType.ConcatenateFiles:
                            break;
                        case IntentType.WriteFile:
                            break;
                        case IntentType.DeleteFile:
                            break;
                        case IntentType.GetFileInfo:
                            break;
                        case IntentType.GetOptions:
                            break;
                        default:
                            break;
                    }

                    return Task.CompletedTask;
                },

                OnBeforeCreateAsync = ctx =>
                {
                    // Partial files are not complete so we do not need to validate
                    // the metadata in our example.
                    if (ctx.FileConcatenation is FileConcatPartial)
                    {
                        return Task.CompletedTask;
                    }

                    if (!ctx.Metadata.ContainsKey("name") || ctx.Metadata["name"].HasEmptyValue)
                    {
                        ctx.FailRequest("name metadata must be specified. ");
                    }

                    if (!ctx.Metadata.ContainsKey("contentType") || ctx.Metadata["contentType"].HasEmptyValue)
                    {
                        ctx.FailRequest("contentType metadata must be specified. ");
                    }

                    return Task.CompletedTask;
                },
                OnCreateCompleteAsync = ctx =>
                {
                    logger.LogInformation($"Created file {ctx.FileId} using {ctx.Store.GetType().FullName}");
                    return Task.CompletedTask;
                },
                OnBeforeDeleteAsync = ctx =>
                {
                    // Can the file be deleted? If not call ctx.FailRequest(<message>);
                    return Task.CompletedTask;
                },
                OnDeleteCompleteAsync = ctx =>
                {
                    logger.LogInformation($"Deleted file {ctx.FileId} using {ctx.Store.GetType().FullName}");
                    return Task.CompletedTask;
                },
                OnFileCompleteAsync = async ctx =>
                {
                    logger.LogInformation($"Upload of {ctx.FileId} completed using {ctx.Store.GetType().FullName}");
                    // If the store implements ITusReadableStore one could access the completed file here.
                    // The default TusDiskStore implements this interface:
                    //var file = await ctx.GetFileAsync();

                    // 合成文件
                    var file = await ctx.GetFileAsync();
                    var metadata = await file.GetMetadataAsync(ctx.CancellationToken);
                    //string data = metadata["data"].GetString(Encoding.UTF8);
                    var contentType = metadata["contentType"].GetString(Encoding.UTF8);
                    var path = Path.Combine($"{diskStorePath}", "mergeFiles");
                    if (!System.IO.File.Exists(path))
                    {
                        _ = Directory.CreateDirectory(path);
                    }
                    var filePath = Path.Combine(path, $"{ctx.FileId}.{contentType.Split('/').Last()}");
                    await using var fileStream = await file.GetContentAsync(ctx.CancellationToken);
                    await using var fileOutputStream = new FileStream(filePath, FileMode.Create);
                    await fileStream.CopyToAsync(fileOutputStream);
                }
            },
            // Set an expiration time where incomplete files can no longer be updated.
            // This value can either be absolute or sliding.
            // Absolute expiration will be saved per file on create
            // Sliding expiration will be saved per file on create and updated on each patch/update.
            Expiration = new AbsoluteExpiration(TimeSpan.FromMinutes(5))
        };

        return Task.FromResult(config);
    }
}