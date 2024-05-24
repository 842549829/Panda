using Panda.Messaging.Domain.Providers;

namespace Panda.Net.MessageProviders.PublishProviders;

/// <summary>
/// 按用户来发送
/// </summary>
public class UserMessagePublishProvider : IMessagePublishProvider
{
    /// <summary>
    /// 消息范围提供商
    /// </summary>
    public string ProviderName => "U";

    /// <summary>
    /// 获取通知用户Id集合
    /// </summary>
    /// <param name="providerKey">关联提供商类型名称（S：All，A：Number，O：Number，D：Number，R：RoleName，G：Number，U：UserName）</param>
    /// <returns>用户集合Id</returns>
    public Task<Guid[]> GetNotifyingUsers(string providerKey)
    {
        return Task.FromResult(new[] { Guid.Parse(providerKey) });
    }
}