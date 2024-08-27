namespace Panda.Domain.Entities;

public interface IMayHaveAddress
{
    public string? NationCode { get; }

    public string? ProvinceCode { get; }

    public string? CityCode { get; }

    public string? DistrictCode { get; }

    public string? Street { get; }

    public string? AddressLine { get; }
}