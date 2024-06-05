namespace Panda.DataPermission.Abstractions.DataPermission
{
    /// <summary>
    /// 数据权限
    /// </summary>
    public enum DataPermission
    {
        /// <summary>
        /// 全部数据权限
        /// </summary>
        All = 0,

        /// <summary>
        /// 本门组织
        /// </summary>
        Cur = 1,

        /// <summary>
        /// 下级组织数据权限
        /// </summary>
        Sub = 2,

        /// <summary>
        /// 本组织及下级组织数据权限
        /// </summary>
        CurAndSub = 3,

        /// <summary>
        /// 自定义
        /// </summary>
        Custom = 4
    }
}