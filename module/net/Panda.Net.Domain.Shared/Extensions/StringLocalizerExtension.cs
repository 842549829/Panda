using Microsoft.Extensions.Localization;

namespace Panda.Net.Extensions;

public static class StringLocalizerExtension
{
    public static string DisplayValue(this IStringLocalizer stringLocalizer, string name)
    {
        var names = name.Split(',');
        var key = names.Length == 2 ? names[1] : name;
        return stringLocalizer[key];
    }
}