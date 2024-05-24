using Volo.Abp.DependencyInjection;

namespace Panda.Messaging.Domain.Providers;

/// <summary>
/// 消息发布者Provider
/// </summary>
public interface IMessagePublishProvider : ITransientDependency
{
    /// <summary>
    /// 消息范围提供商
    /// </summary>
    string ProviderName { get; }

    /// <summary>
    /// 获取通知用户Id集合
    /// </summary>
    /// <param name="providerKey">关联提供商类型名称（S：All，A：Number，O：Number，D：Number，R：RoleName，G：Number，U：UserName）</param>
    /// <returns>用户集合Id</returns>
    Task<Guid[]> GetNotifyingUsers(string providerKey);
}