using Panda.Net.Localization;
using Volo.Abp.AspNetCore.Mvc;

namespace Panda.Net.Controllers;

/* Inherit your controllers from this class.
 */
public abstract class NetController : AbpControllerBase
{
    protected NetController()
    {
        LocalizationResource = typeof(NetResource);
    }
}
