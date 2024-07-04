using Panda.Application.Contracts.Permissions;

namespace Panda.DataDictionary.Application.Contracts.Permissions;

public class DataDictionaryPermissions
{
    public static class DataDictionary
    {
        public const string Default = PandaPermissions.GroupName + ".DataDictionary";
        public const string Create = Default + ".Create";
        public const string Update = Default + ".Update";
        public const string Delete = Default + ".Delete";
    }
}