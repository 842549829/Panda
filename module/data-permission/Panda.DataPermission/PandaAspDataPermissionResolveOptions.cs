using Panda.DataPermission.Abstractions.DataPermission;

namespace Panda.DataPermission;

public class PandaAspDataPermissionResolveOptions
{
    public List<IDataPermissionResolveContributor> DataPermissionResolves { get; set; }
    
    public PandaAspDataPermissionResolveOptions()
    {
        DataPermissionResolves = new List<IDataPermissionResolveContributor>();
    }
}