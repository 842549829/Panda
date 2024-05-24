namespace Panda.File.HttpApi.TusdotNet;

public class TusDiskStorageOptionHelper
{
    public string StorageDiskPath { get; }

    public TusDiskStorageOptionHelper()
    {
        var path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "wwwroot", "files");
        if (!System.IO.File.Exists(path))
        {
            _ = Directory.CreateDirectory(path);
        }

        StorageDiskPath = path;
    }
}