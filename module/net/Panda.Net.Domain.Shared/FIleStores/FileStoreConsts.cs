namespace Panda.Net.FIleStores;

public static class FileStoreConsts
{
    public static int MaxFileStoreNameLength { get; set; } = 256;

    public static int MaxFileStoreMd5Length { get; set; } = 32;

    public static int MaxFileStorePathLength { get; set; } = 4096;

    public static int MaxFileStoreProjectNameLength { get; set; } = 64;

    public static int MaxFileStoreExtensionLength { get; set; } = 32;
}