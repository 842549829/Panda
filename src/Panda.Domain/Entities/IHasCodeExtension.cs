namespace Panda.Domain.Entities;

public interface IHasCodeExtension : IHasCode
{
    public void SetCode(string code);
}