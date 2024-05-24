﻿using Panda.Messaging.Domain.Entities;
using Panda.Messaging.Domain.Shared.Enums;
using Panda.Messaging.Domain.Shared.Models;
using Volo.Abp.Data;
using Volo.Abp.DependencyInjection;

namespace Panda.Messaging.Domain.Factories;

/// <summary>
/// 消息实体创建工厂接口
/// </summary>
public interface IMessageFactory : ITransientDependency
{
    /// <summary>
    /// 创建消息
    /// </summary>
    /// <param name="applicationName">所属系统名称（消息发起系统）</param>
    /// <param name="messageType">消息类型 1：通知，2：预警</param>
    /// <param name="pushProviderCode">消息推送方式 1：系统消息，2：短信消息，4：邮件消息</param>
    /// <param name="title">标题</param>
    /// <param name="content">内容</param>
    /// <param name="delayedSend">是否定时发送（延迟发送）0：否 1：是</param>
    /// <param name="sendUserId">发送人Id</param>
    /// <param name="sendUserName">发送人名称</param>
    /// <param name="scopes">通知范围 key：providerName，value：providerKey</param>
    /// <param name="id">Id</param>
    /// <param name="tag">标签 二进制编码，用于扩展</param>
    /// <param name="sendTime">发送时间（及时发送则为创建时间）空则为及时发送</param>
    /// <param name="expirationTime">到期时间（到期后收件人不可查看）</param>
    /// <param name="extraProperties">扩展信息</param>
    Task<Message> CreateAsync(
        string applicationName,
        MessageType messageType,
        PushProviderCode pushProviderCode,
        string title,
        string content,
        bool delayedSend,
        Guid sendUserId,
        string sendUserName,
        MessageScopeModel[] scopes,
        Guid? id = null,
        long? tag = null,
        DateTime? sendTime = null,
        DateTime? expirationTime = null,
        ExtraPropertyDictionary? extraProperties = null);
}