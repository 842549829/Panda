namespace Panda.DataPermission.Abstractions.DataPermission
{
    public interface ICurrentDataPermission
    {
        bool IsAvailable { get; }

        string? Code { get; }

        DataPermission? DataPermission { get; }

        IDisposable Change(string? code = null, DataPermission? dataPermission = null);
    }
}