using Microsoft.EntityFrameworkCore;
using Panda.DataPermission.Abstractions.DataPermission;
using System.Linq.Expressions;
using Volo.Abp;
using Volo.Abp.EntityFrameworkCore;

namespace Panda.EntityFrameworkCore.DataPermission.EntityFrameworkCore
{
    public abstract class DataPermissionDbContext<TDbContext> : AbpDbContext<TDbContext>
        where TDbContext : DbContext
    {
        protected virtual bool IsDataPermissionFilterEnabled => DataFilter?.IsEnabled<IDataPermission>() ?? false;

        protected virtual string? CurrentDataPermissionCode => CurrentDataPermission?.Code;

        protected virtual Panda.DataPermission.Abstractions.DataPermission.DataPermission? DataPermission => CurrentDataPermission?.DataPermission;

        public ICurrentDataPermission CurrentDataPermission => LazyServiceProvider.LazyGetRequiredService<ICurrentDataPermission>();

        protected DataPermissionDbContext(DbContextOptions<TDbContext> options) : base(options)
        {
        }

        protected override Expression<Func<TEntity, bool>>? CreateFilterExpression<TEntity>()
            where TEntity : class
        {
            var expression = base.CreateFilterExpression<TEntity>();

            if (typeof(ISoftDelete).IsAssignableFrom(typeof(TEntity)))
            {
                expression = e => !IsSoftDeleteFilterEnabled || !EF.Property<bool>(e, "IsDeleted");
            }

            if (typeof(IDataPermission).IsAssignableFrom(typeof(TEntity)) && DataPermission != null)
            {
                switch (DataPermission.Value)
                {
                    case Panda.DataPermission.Abstractions.DataPermission.DataPermission.All:
                        break;
                    case Panda.DataPermission.Abstractions.DataPermission.DataPermission.Cur:
                        {
                            Expression<Func<TEntity, bool>> multiTenantFilter = e => !IsDataPermissionFilterEnabled || EF.Property<string>(e, nameof(IDataPermission.Code)) == CurrentDataPermissionCode;
                            expression = expression == null ? multiTenantFilter : QueryFilterExpressionHelper.CombineExpressions(expression, multiTenantFilter);
                            break;
                        }
                    case Panda.DataPermission.Abstractions.DataPermission.DataPermission.CurAndSub:
                        {
                            Expression<Func<TEntity, bool>> multiTenantFilter = e => !IsDataPermissionFilterEnabled
                                || EF.Property<string>(e, nameof(IDataPermission.Code)) == CurrentDataPermissionCode
                                || EF.Property<string>(e, nameof(IDataPermission.Code)).StartsWith(CurrentDataPermissionCode!);
                            expression = expression == null ? multiTenantFilter : QueryFilterExpressionHelper.CombineExpressions(expression, multiTenantFilter);
                            break;
                        }
                    case Panda.DataPermission.Abstractions.DataPermission.DataPermission.Sub:
                        {
                            Expression<Func<TEntity, bool>> multiTenantFilter = e => !IsDataPermissionFilterEnabled
                                || (EF.Property<string>(e, nameof(IDataPermission.Code)) != CurrentDataPermissionCode
                                && EF.Property<string>(e, nameof(IDataPermission.Code)).StartsWith(CurrentDataPermissionCode!));
                            expression = expression == null ? multiTenantFilter : QueryFilterExpressionHelper.CombineExpressions(expression, multiTenantFilter);
                            break;
                        }
                    case Panda.DataPermission.Abstractions.DataPermission.DataPermission.Custom:
                        {
                            var codes = CurrentDataPermissionCode!.Split(',');
                            Expression<Func<TEntity, bool>> multiTenantFilter = e => !IsDataPermissionFilterEnabled || codes.Contains(EF.Property<string>(e, nameof(IDataPermission.Code)));
                            expression = expression == null ? multiTenantFilter : QueryFilterExpressionHelper.CombineExpressions(expression, multiTenantFilter);
                            break;
                        }
                    default:
                        throw new ArgumentOutOfRangeException();
                }

            }

            return expression;
        }
    }
}