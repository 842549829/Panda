using Panda.Net.Bases.Users.Dtos;
using System.Threading.Tasks;
using Volo.Abp.Application.Services;

namespace Panda.Net.Bases.Users;

public interface IAccountAppService : IApplicationService
{
    /// <summary>
    /// 登录
    /// </summary>
    /// <param name="input">登录参数</param>
    /// <returns>登录结果</returns>
    Task<LoginResultDto> LoginAsync(LoginInputDto input);

    /// <summary>
    /// 用refresh token获取新的access token
    /// </summary>
    /// <param name="input">refresh token</param>
    /// <returns>刷新结果</returns>
    Task<LoginResultDto> RefreshAsync(RefreshTokenInputDto input);
}