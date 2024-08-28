namespace Panda.Domain.Entities;

public interface IHasNameExtension : IHasName
{
    public void SetName(string name);
}