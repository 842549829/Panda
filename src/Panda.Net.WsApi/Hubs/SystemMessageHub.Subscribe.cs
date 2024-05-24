namespace Panda.Net.Hubs;

public class SubscribeMessage
{
    public string Id { get; set; }

    public string Message { get; set; }
}

public partial class SystemMessageHub
{
    /// <summary>
    /// 测试接收消息
    /// </summary>
    /// <returns>标识一个异步方法</returns>
    public async Task SubscribeMessageAsync(SubscribeMessage subscribe)
    {
        Console.WriteLine(subscribe.Message);
        await Task.CompletedTask;
    }
}