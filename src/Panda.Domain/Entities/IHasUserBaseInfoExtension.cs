namespace Panda.Domain.Entities;

public interface IHasUserBaseInfoExtension : IHasUserBaseInfo
{
    public void SetBirthday(DateTime? birthday);

    public void SetEmail(string? email);
}