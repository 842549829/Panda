namespace Panda.Domain.Entities;

public abstract class FullPersonnelAuditedAggregateRoot<TKey>(string name, string code, string idCardType, string idCardNo, string gender, string phone) 
    : FullHealthcareAuditedAggregateRoot<TKey>(name, code), IHasUserBaseInfoExtension
{
    public string? NationCode { get; private set; }

    public string? ProvinceCode { get; private set; }

    public string? CityCode { get; private set; }

    public string? DistrictCode { get; private set; }

    public string? Street { get; private set; }

    public string? AddressLine { get; private set; }

    /// <summary>
    /// 岁
    /// </summary>
    public int? Year { get; private set; }

    /// <summary>
    /// 月
    /// </summary>
    public int? Month { get; private set; }

    /// <summary>
    /// 天
    /// </summary>
    public int? Day { get; private set; }

    /// <summary>
    /// 证件类型
    /// </summary>
    public string IdCardType { get; private set; } = idCardType;

    /// <summary>
    /// 身份号码
    /// </summary>
    public string IdCardNo { get; private set; } = idCardNo;

    /// <summary>
    /// 性别
    /// </summary>
    public string Gender { get; private set; } = gender;

    public DateTime? Birthday { get; private set; }

    public string Phone { get; private set; } = phone;

    public string? Email { get; private set; }

    public void SetIdCard(string idCardType, string idCardNo)
    {
        IdCardType = idCardType;
        IdCardNo = idCardNo;
    }

    public void SetBirthday(DateTime? birthday)
    {
        Birthday = birthday;
        if (!birthday.HasValue)
        {
            return;
        }
        var (years, months, days) = CalculateAge(birthday.Value);
        Year ??= years;
        Month ??= months;
        Day ??= days;
    }

    public void SetEmail(string? email)
    {
        Email = email;
    }

    public void SetAge(int? year, int? month, int? day)
    {
        Year = year;
        Month = month;
        Day = day;

        if (year.HasValue && month.HasValue && day.HasValue && !Birthday.HasValue)
        {
            Birthday = new DateTime(year.Value, month.Value, day.Value);
        }
    }

    public void SetAddress(string nationCode, string provinceCode, string cityCode, string districtCode, string street,
        string addressLine)
    {
        NationCode = nationCode;
        ProvinceCode = provinceCode;
        CityCode = cityCode;
        DistrictCode = districtCode;
        Street = street;
        AddressLine = addressLine;
    }

    /// <summary>
    /// 计算年龄并返回年龄、月份和天数
    /// </summary>
    /// <param name="dateOfBirth">出生日期</param>
    /// <returns>年龄信息</returns>
    public static Tuple<int, int, int> CalculateAge(DateTime dateOfBirth)
    {
        var today = DateTime.Today;
        var ageSpan = today - dateOfBirth;
        var years = ageSpan.Days / 365;
        var remainingDays = ageSpan.Days % 365;
        var months = remainingDays / 30;
        var days = remainingDays % 30;

        // 调整月份和天数
        if (today.Month < dateOfBirth.Month || (today.Month == dateOfBirth.Month && today.Day < dateOfBirth.Day))
        {
            years--;
            months += 12;
        }

        if (months < 0)
        {
            months += 12;
            years--;
        }

        if (months >= 12)
        {
            years++;
            months -= 12;
        }

        // 调整天数
        if (days < 0)
        {
            months--;
            days += 30;
        }

        if (months < 0)
        {
            years--;
            months += 12;
        }

        return Tuple.Create(years, months, days);
    }
}