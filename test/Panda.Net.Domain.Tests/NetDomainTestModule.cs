using Panda.Net.EntityFrameworkCore;
using Volo.Abp.Modularity;

namespace Panda.Net;

[DependsOn(
    typeof(NetEntityFrameworkCoreTestModule)
    )]
public class NetDomainTestModule : AbpModule
{

}
