using System.Threading.Tasks;
using Volo.Abp.Application.Services;

namespace Panda.Net.Bases.Settings;

public interface ISettingAppService : IApplicationService
{
    Task SetAsync();
}