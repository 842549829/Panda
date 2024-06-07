namespace Panda.DataPermission.Abstractions.DataPermission;

public class DataPermissionResolveResult
{
    public string? DataPermissionCode { get; set; }
    
    public DataPermission? DataPermission { get; set; }
    
    public List<string> AppliedResolvers { get; }

    public DataPermissionResolveResult()
    {
        AppliedResolvers = new List<string>();
    }
}