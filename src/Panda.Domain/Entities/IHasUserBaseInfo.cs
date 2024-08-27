namespace Panda.Domain.Entities;

public interface IHasUserBaseInfo : IMayHaveAddressExtension, IMayHaveAgeExtension, IHasIdCardExtension
{
    /// <summary>
    /// 姓名
    /// </summary>
    public string Name { get; }

    /// <summary>
    /// 性别
    /// </summary>
    public string Gender { get; }

    public DateTime? Birthday { get; }

    public string Phone { get; }

    public string? Email { get; }
}