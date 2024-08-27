namespace Panda.Domain.Entities;

public interface IHasIdCardExtension : IHasIdCard
{
    public void SetIdCard(string idCardType, string idCardNo);
}