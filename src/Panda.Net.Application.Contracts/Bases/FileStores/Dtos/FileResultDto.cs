namespace Panda.Net.Bases.FileStores.Dtos;

public class FileResultDto
{
    public string FileDownloadName { get; set; }

    public byte[] FileBytes { get; set; }

    public string? ContextType { get; set; }
}