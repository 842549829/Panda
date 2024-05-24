using Panda.Net.Localization;
using Volo.Abp.Application.Services;

namespace Panda.Net;

/* Inherit your application services from this class.
 */
public abstract class NetAppService : ApplicationService
{
    protected NetAppService()
    {
        LocalizationResource = typeof(NetResource);
    }
}
