namespace Panda.Domain.Entities;

public interface IMayHaveAge
{
    /// <summary>
    /// 岁
    /// </summary>
    int? Year { get; }

    /// <summary>
    /// 月
    /// </summary>
    int? Month { get; }

    /// <summary>
    /// 天
    /// </summary>
    int? Day { get; }
}