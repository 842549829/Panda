namespace Panda.Domain.Entities;

public interface IMayHaveAddressExtension : IMayHaveAddress
{
    public void SetAddress(string nationCode, string provinceCode, string cityCode, string districtCode, string street,
        string addressLine);
}