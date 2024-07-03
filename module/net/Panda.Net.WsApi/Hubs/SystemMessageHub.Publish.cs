using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.Logging;
using Panda.Messaging.Domain.Shared.Constants;
using Panda.Messaging.Domain.Shared.Models;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Users;

namespace Panda.Net.Hubs;

/// <summary>
/// 系统消息
/// </summary>
public partial class SystemMessageHub : Hub, ISingletonDependency
{
    private readonly ILogger<SystemMessageHub> _logger;
    private readonly IHttpContextAccessor _httpContextAccessor;
    private readonly ICurrentUser _currentUser;

    public SystemMessageHub(ILogger<SystemMessageHub> logger,
        IHttpContextAccessor httpContextAccessor,
        ICurrentUser currentUser)
    {
        _logger = logger;
        _httpContextAccessor = httpContextAccessor;
        _currentUser = currentUser;
    }

    /// <summary>
    /// 推送消息
    /// </summary>
    /// <param name="title">标题</param>
    /// <param name="content">内容</param>
    /// <param name="scopes">通知范围 key：providerName，value：providerKey</param>
    /// <param name="id">id 可空.</param>
    /// <param name="sendUserId">发送人Id 可空.</param>
    /// <param name="sendUserName">发送人姓名 可空.</param>
    /// <returns>标识一个异步方法</returns>
    public Task PushAsync(
        string title,
        string content,
        MessageScopeModel[] scopes,
        string? id = null,
        Guid? sendUserId = null,
        string? sendUserName = null)
    {
        return IsSystemMessage(scopes)
            ? SendSystemMessageAsync(id, title, content, sendUserId, sendUserName)
            : SendNormalMessageAsync(id, title, content, sendUserId, sendUserName, scopes);
    }


    /// <summary>
    /// 是否为全局消息
    /// </summary>
    /// <param name="scopes">消息范围</param>
    /// <returns></returns>
    protected virtual bool IsSystemMessage(MessageScopeModel[] scopes) =>
        scopes.Any(s => s.ProviderName == MessageScopingConstants.MessageScopingProviderName.System);

    /// <summary>
    ///  发送全局消息
    /// </summary>
    /// <returns></returns>
    protected virtual Task SendSystemMessageAsync(string? id, string title, string content, Guid? sendUserId,
        string? sendUserName)
    {
        if (Clients == null)
        {
            _logger.LogWarning("客户端未连接成功");
            return Task.CompletedTask;
        }
        var task = Clients.All
            .SendAsync("MessageNotification", new
            {
                Id = id,
                Title = title,
                Content = content,
                SendTime = DateTime.Now,
                SendUserId = sendUserId,
                SendUserName = sendUserName
            });

        _logger.LogInformation("发送消息成功");
        return task;
    }

    protected virtual async Task SendNormalMessageAsync(string? id, string title, string content, Guid? sendUserId,
        string? sendUserName, MessageScopeModel[] scopes)
    {
        var groupNames = GetNotificationGroupNames(scopes);

        if (Clients == null)
        {
            _logger.LogWarning("客户端未连接成功");
            return;
        }
        await Clients.Groups(groupNames)
            .SendAsync("MessageNotification", new
            {
                Id = id,
                Title = title,
                Content = content,
                SendTime = DateTime.Now,
                SendUserId = sendUserId,
                SendUserName = sendUserName
            });
        _logger.LogInformation("发送消息成功");
    }

    /// <summary>
    /// 获取通知群组名称
    /// </summary>
    /// <param name="scopes">通知范围</param>
    /// <returns></returns>
    protected virtual string[] GetNotificationGroupNames(MessageScopeModel[] scopes)
    {
        var groupNames = new List<string>();

        foreach (var scope in scopes)
        {
            groupNames.Add(GetGroupName(scope.ProviderName, scope.ProviderKey));
        }

        return groupNames.Distinct().ToArray();
    }

    /// <summary>
    /// 获取客户端组名称
    /// </summary>
    /// <param name="providerName">providerName</param>
    /// <param name="providerKey">providerKey</param>
    /// <returns>GroupName</returns>
    private static string GetGroupName(string? providerName, string? providerKey) => $"{providerName}:{providerKey}";

    /// <summary>
    /// 初始链接
    /// </summary>
    /// <returns>标识一个异步方法</returns>
    public override async Task OnConnectedAsync()
    {
        //var header = _httpContextAccessor.HttpContext?.Request.Headers;
        //if (header != null)
        //{
        //    var userId = header["UserIdentity"];
        //    // 添加到用户自己的通知组
        //    await Groups.AddToGroupAsync(Context.ConnectionId, GetGroupName("U", userId.ToString()));
        //}
        if (_currentUser.Id.HasValue)
        {
            //添加到用户自己的通知组
            await Groups.AddToGroupAsync(Context.ConnectionId, GetGroupName("U", _currentUser.Id.ToString()));
        }

        await base.OnConnectedAsync();
    }
}