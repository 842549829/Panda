using Volo.Abp.EntityFrameworkCore.Modeling;

namespace Panda.Messaging.EntityFrameworkCore.EntityFrameworkCore.Configs;

/// <summary>
/// 消息模型配置类
/// </summary>
public class MessageModelBuilderConfigurationOptions : AbpModelBuilderConfigurationOptions
{
    /// <summary>
    /// 构造函数
    /// </summary>
    /// <param name="tablePrefix">表前缀</param>
    /// <param name="schema">命令空间</param>
    public MessageModelBuilderConfigurationOptions(
        string tablePrefix = "",
        string? schema = null)
        : base(
            tablePrefix,
            schema)
    {

    }
}