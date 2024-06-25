//using Microsoft.EntityFrameworkCore.ChangeTracking;
//using Microsoft.Extensions.Options;
//using Volo.Abp.Auditing;
//using Volo.Abp.DependencyInjection;
//using Volo.Abp.EntityFrameworkCore.EntityHistory;
//using Volo.Abp.Json;
//using Volo.Abp.Reflection;
//using Volo.Abp.Timing;

//namespace Panda.EntityFrameworkCore.DataPermission.EntityFrameworkCore;

//public interface IDepartment
//{
//    Guid DepartmentId { get; }
//}

///// <summary>
///// 自定义日志记录 如果修改的部门Id则写入修改的是部门名称
///// </summary>
//[Dependency(ReplaceServices = true)]
//public class DataPermissionEntityHistoryHelper : EntityHistoryHelper, ITransientDependency
//{
//    public DataPermissionEntityHistoryHelper(IAuditingStore auditingStore,
//        IOptions<AbpAuditingOptions> options,
//        IClock clock,
//        IJsonSerializer jsonSerializer,
//        IAuditingHelper auditingHelper) :
//        base(auditingStore, options, clock, jsonSerializer, auditingHelper)
//    {
//    }

//    protected override List<EntityPropertyChangeInfo> GetPropertyChanges(EntityEntry entityEntry)
//    {
//        var propertyChanges = new List<EntityPropertyChangeInfo>();
//        var properties = entityEntry.Metadata.GetProperties();
//        var isCreated = IsCreated(entityEntry);
//        var isDeleted = IsDeleted(entityEntry);

//        foreach (var property in properties)
//        {
//            var propertyEntry = entityEntry.Property(property.Name);
//            if (!ShouldSavePropertyHistory(propertyEntry, isCreated || isDeleted) || IsSoftDeleted(entityEntry))
//            {
//                continue;
//            }

//            // 如果当前属性是部门Id则写入部门名称
//            var propertyInfo = propertyEntry.Metadata.PropertyInfo;
//            var entityType = propertyEntry.EntityEntry.Entity.GetType();
//            if (propertyInfo != null 
//                && propertyInfo.Name == nameof(IDepartment.DepartmentId)
//                && entityType.IsAssignableTo<IDepartment>())
//            {
//                var currentDepartmentId = propertyEntry.CurrentValue!;
//                var originalDepartmentId = propertyEntry.OriginalValue!;

//                propertyChanges.Add(new EntityPropertyChangeInfo
//                {
//                    NewValue = isDeleted
//                        ? null
//                        : GetDepartmentName(currentDepartmentId),
//                    OriginalValue = isCreated
//                        ? null
//                        : GetDepartmentName(originalDepartmentId),
//                    PropertyName = property.Name,
//                    PropertyTypeFullName = property.ClrType.GetFirstGenericArgumentIfNullable().FullName!
//                });
//            }
//            else
//            {
//                propertyChanges.Add(new EntityPropertyChangeInfo
//                {
//                    NewValue = isDeleted
//                        ? null
//                        : JsonSerializer.Serialize(propertyEntry.CurrentValue!)
//                            .TruncateWithPostfix(EntityPropertyChangeInfo.MaxValueLength),
//                    OriginalValue = isCreated
//                        ? null
//                        : JsonSerializer.Serialize(propertyEntry.OriginalValue!)
//                            .TruncateWithPostfix(EntityPropertyChangeInfo.MaxValueLength),
//                    PropertyName = property.Name,
//                    PropertyTypeFullName = property.ClrType.GetFirstGenericArgumentIfNullable().FullName!
//                });
//            }
//        }

//        if (!Options.SaveEntityHistoryWhenNavigationChanges || AbpEfCoreNavigationHelper == null)
//        {
//            return propertyChanges;
//        }

//        foreach (var (navigationEntry, index) in entityEntry.Navigations.Select((value, i) => (value, i)))
//        {
//            if (AbpEfCoreNavigationHelper.IsNavigationEntryModified(entityEntry, index))
//            {
//                propertyChanges.Add(new EntityPropertyChangeInfo
//                {
//                    PropertyName = navigationEntry.Metadata.Name,
//                    PropertyTypeFullName =
//                        navigationEntry.Metadata.ClrType.GetFirstGenericArgumentIfNullable().FullName!
//                });
//            }
//        }

//        return propertyChanges;
//    }

//    public string GetDepartmentName(object departmentId)
//    {
//        return string.Empty;
//    }
//}