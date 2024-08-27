namespace Panda.Domain.Entities;

public record Address(string? NationCode, string? ProvinceCode, string? CityCode, string? DistrictCode, string? Street, string? AddressLine) : IMayHaveAddress;