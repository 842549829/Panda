using Volo.Abp.Modularity;

namespace Panda.Net;

[DependsOn(
    typeof(NetApplicationModule),
    typeof(NetDomainTestModule)
    )]
public class NetApplicationTestModule : AbpModule
{

}
