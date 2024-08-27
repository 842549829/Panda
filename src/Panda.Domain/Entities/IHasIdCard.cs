namespace Panda.Domain.Entities;

public interface IHasIdCard
{
    /// <summary>
    /// 证件类型
    /// </summary>
    public string IdCardType { get; }

    /// <summary>
    /// 身份号码
    /// </summary>
    public string IdCardNo { get; }
}