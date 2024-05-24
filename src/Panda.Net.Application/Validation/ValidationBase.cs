using FluentValidation;
using System;

namespace Panda.Net.Validation;

public class ValidationBase<T> : AbstractValidator<T>
{
    /// <summary>
    /// 验证身份证合理性
    /// </summary>
    /// <param name="idNumber">身份证号</param>
    /// <returns></returns>
    protected static bool CheckIdCard(string idNumber)
    {
        if (string.IsNullOrWhiteSpace(idNumber))
        {
            return false;
        }
        if (idNumber.Length == 18)
        {
            var check = CheckIdCard18(idNumber);
            return check;
        }
        if (idNumber.Length != 15)
        {
            return false;
        }

        {
            var check = CheckIdCard15(idNumber);
            return check;
        }
    }

    /// <summary>
    /// 18位身份证号码验证
    /// </summary>
    protected static bool CheckIdCard18(string idNumber)
    {
        if (long.TryParse(idNumber.Remove(17), out var n) == false
            || n < Math.Pow(10, 16)
            || long.TryParse(idNumber.Replace('x', '0').Replace('X', '0'), out n) == false)
        {
            return false;//数字验证
        }
        //省份编号
        const string address = "11x22x35x44x53x12x23x36x45x54x13x31x37x46x61x14x32x41x50x62x15x33x42x51x63x21x34x43x52x64x65x71x81x82x91";
        if (address.IndexOf(idNumber.Remove(2), StringComparison.Ordinal) == -1)
        {
            return false;//省份验证
        }
        var birth = idNumber.Substring(6, 8).Insert(6, "-").Insert(4, "-");
        if (DateTime.TryParse(birth, out _) == false)
        {
            return false;//生日验证
        }
        var arrArrifyCode = ("1,0,x,9,8,7,6,5,4,3,2").Split(',');
        var wi = ("7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2").Split(',');
        var ai = idNumber.Remove(17).ToCharArray();
        var sum = 0;
        for (var i = 0; i < 17; i++)
        {
            // 加权求和
            sum += int.Parse(wi[i]) * int.Parse(ai[i].ToString());
        }
        //得到验证码所在位置
        Math.DivRem(sum, 11, out var y);
        var x = idNumber.Substring(17, 1).ToLower();
        var yy = arrArrifyCode[y];
        if (yy != x)
        {
            return false;//校验码验证
        }
        return true;//符合GB11643-1999标准
    }

    /// <summary>
    /// 15位身份证号码验证
    /// </summary>
    protected static bool CheckIdCard15(string idNumber)
    {
        if (long.TryParse(idNumber, out var n) == false || n < Math.Pow(10, 14))
        {
            return false;//数字验证
        }
        const string address = "11x22x35x44x53x12x23x36x45x54x13x31x37x46x61x14x32x41x50x62x15x33x42x51x63x21x34x43x52x64x65x71x81x82x91";
        if (address.IndexOf(idNumber.Remove(2), StringComparison.Ordinal) == -1)
        {
            return false;//省份验证
        }
        var birth = idNumber.Substring(6, 6).Insert(4, "-").Insert(2, "-");
        return DateTime.TryParse(birth, out _);
    }

    /// <summary>
    /// 手机/座机号码验证
    /// </summary>
    /// <returns></returns>
    protected static bool ValidationTelephone(string phone)
    {
        return global::System.Text.RegularExpressions.Regex.IsMatch(phone,
                   @"0\d{2,3}-\d{7,8}|\(?0\d{2,3}[)-]?\d{7,8}|\(?0\d{2,3}[)-]*\d{7,8}") ||
               global::System.Text.RegularExpressions.Regex.IsMatch(phone, @"^[1][3-9][0-9]\d{8}$") || phone.IsNullOrWhiteSpace();
    }

    /// <summary>
    /// 排序号验证
    /// </summary>
    /// <returns></returns>
    protected static bool ValidationSortNo(int sortNo)
    {
        return sortNo >= 0 && sortNo <= 999;
    }
}