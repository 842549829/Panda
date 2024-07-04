using Microsoft.EntityFrameworkCore;
using Panda.DataPermission.Abstractions.DataPermission;
using System.Linq.Expressions;
using Volo.Abp.EntityFrameworkCore;

namespace Panda.DataPermission.EntityFrameworkCore.EntityFrameworkCore;

public abstract class DataPermissionDbContext<TDbContext> : AbpDbContext<TDbContext>
    where TDbContext : DbContext
{
    protected virtual bool IsDataPermissionFilterEnabled => DataFilter?.IsEnabled<IDataPermission>() ?? false;

    protected virtual string? CurrentDataPermissionCode => CurrentDataPermission?.Code;

    protected virtual string[]? CurrentDataPermissionCodes => CurrentDataPermission?.Code?.Split(',');

    protected virtual Abstractions.DataPermission.DataPermission? DataPermission => CurrentDataPermission?.DataPermission;

    public ICurrentDataPermission CurrentDataPermission => LazyServiceProvider.LazyGetRequiredService<ICurrentDataPermission>();

    protected DataPermissionDbContext(DbContextOptions<TDbContext> options) : base(options)
    {
    }

    protected override Expression<Func<TEntity, bool>>? CreateFilterExpression<TEntity>()
        where TEntity : class
    {
        var expression = base.CreateFilterExpression<TEntity>();
        if (typeof(IDataPermission).IsAssignableFrom(typeof(TEntity)))
        {

            Expression<Func<TEntity, bool>> dataPermissionFilter = e => !IsDataPermissionFilterEnabled
                                                                        || DataPermission == Abstractions.DataPermission.DataPermission.All
                                                                        || (DataPermission == Abstractions.DataPermission.DataPermission.Cur && EF.Property<string>(e, nameof(IDataPermission.Code)) == CurrentDataPermissionCode)
                                                                        || (DataPermission == Abstractions.DataPermission.DataPermission.Cur && (EF.Property<string>(e, nameof(IDataPermission.Code)) == CurrentDataPermissionCode || EF.Property<string>(e, nameof(IDataPermission.Code)).StartsWith(CurrentDataPermissionCode!)))
                                                                        || (DataPermission == Abstractions.DataPermission.DataPermission.Sub && (EF.Property<string>(e, nameof(IDataPermission.Code)) != CurrentDataPermissionCode && EF.Property<string>(e, nameof(IDataPermission.Code)).StartsWith(CurrentDataPermissionCode!)))
                                                                        || (DataPermission == Abstractions.DataPermission.DataPermission.Custom && CurrentDataPermissionCodes!.Contains(EF.Property<string>(e, nameof(IDataPermission.Code))))
                                                                        ;
            expression = expression == null ? dataPermissionFilter : QueryFilterExpressionHelper.CombineExpressions(expression, dataPermissionFilter);
        }


        return expression;
    }
}