using Microsoft.International.Converters.PinYinConverter;

namespace Panda.Domain.Shared.Extensions;

public static class PinyinExtension
{
    /// <summary> 
    /// 汉字转化为拼音
    /// </summary> 
    /// <param name="str">汉字</param> 
    /// <returns>全拼</returns> 
    public static string GetPinyin(string str)
    {
        string r = string.Empty;
        foreach (char obj in str)
        {
            try
            {
                ChineseChar chineseChar = new ChineseChar(obj);
                string t = chineseChar.Pinyins[0].ToString();
                r += t.Substring(0, t.Length - 1);
            }
            catch
            {
                r += obj.ToString();
            }
        }
        return r;
    }

    /// <summary> 
    /// 汉字转化为拼音首字母
    /// </summary> 
    /// <param name="str">汉字</param> 
    /// <returns>首字母</returns> 
    public static string GetFirstPinyin(string str)
    {
        string r = string.Empty;
        foreach (char obj in str)
        {
            try
            {
                ChineseChar chineseChar = new ChineseChar(obj);
                string t = chineseChar.Pinyins[0].ToString();
                r += t.Substring(0, 1);
            }
            catch
            {
                r += obj.ToString();
            }
        }
        return r;
    }
}