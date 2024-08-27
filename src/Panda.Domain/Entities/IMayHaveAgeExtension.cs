namespace Panda.Domain.Entities;

public interface IMayHaveAgeExtension : IMayHaveAge
{
    public void SetAge(int? year, int? month, int? day);
}