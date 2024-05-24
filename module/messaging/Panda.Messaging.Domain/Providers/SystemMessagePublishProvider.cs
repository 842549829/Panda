using Panda.Messaging.Domain.Shared.Constants;

namespace Panda.Messaging.Domain.Providers;


public class SystemMessagePublishProvider : IMessagePublishProvider
{
    /// <summary>
    /// 消息范围提供商
    /// </summary>
    public string ProviderName { get; } = MessageScopingConstants.MessageScopingProviderName.System;

    public Task<Guid[]> GetNotifyingUsers(string providerKey)
    {
        return Task.FromResult(Array.Empty<Guid>());
    }
}