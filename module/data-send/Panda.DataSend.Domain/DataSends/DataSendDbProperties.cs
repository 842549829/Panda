namespace Panda.DataSend.Domain.DataSends;

public class DataSendDbProperties
{
    /// <summary>
    /// 默认表前缀
    /// </summary>
    public static string DbTablePrefix { get; set; } = "YaDea";

    /// <summary>
    /// 默认命名空间
    /// </summary>
    public static string? DbSchema { get; set; } = null;

    /// <summary>
    /// 默认配置文件节点名称
    /// </summary>

    public const string ConnectionStringName = "DataSend";
}