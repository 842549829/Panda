using System.Linq.Expressions;

namespace Panda.DataPermission.Abstractions.DataPermission
{
    public class User
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
    }

    public static class QueryableExtensions
    {
        public static IQueryable<T> ApplyColumnPermissions<T>(this IQueryable<T> query)
            where T : class
        {
            // 使用反射来动态构建投影
            var columnsToSelect = new List<string> { "FirstName", "Email" };
            if (columnsToSelect is { Count: > 0 })
            {
                // 动态创建选择表达式
                var parameter = Expression.Parameter(typeof(T), "u");
                var bindings = columnsToSelect.Select(column =>
                {
                    var propertyInfo = typeof(T).GetProperty(column)!;
                    var propertyExpr = Expression.Property(parameter, propertyInfo);
                    return Expression.Bind(propertyInfo, propertyExpr); // 直接创建MemberBinding
                }).ToList();

                var constructorInfo = typeof(T).GetConstructor(Type.EmptyTypes)!; // 获取默认构造函数
                var newExpr = Expression.New(constructorInfo);
                var memberInitExpr = Expression.MemberInit(newExpr, bindings);

                var lambda = Expression.Lambda<Func<T, T>>(memberInitExpr, parameter);

                query = query.Select(lambda);
            }
            else
            {
                // 如果没有指定列，则默认选择所有列
                query = query.Select(t => t);
            }
            return query;
        }
    }
}