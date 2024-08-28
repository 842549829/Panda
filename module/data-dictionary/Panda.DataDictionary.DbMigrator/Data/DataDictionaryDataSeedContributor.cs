using Panda.DataDictionary.Domain.DataDictionaries.Entities;
using Panda.DataDictionary.Domain.DataDictionaries.Repositories;
using Panda.DataPermission.Abstractions.DataPermission;
using Panda.Domain.Shared.Enums;
using Volo.Abp.Data;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Guids;
using Volo.Abp.MultiTenancy;
using Volo.Abp.Uow;

namespace Panda.DataDictionary.DbMigrator.Data;

public class DataDictionaryDataSeedContributor : IDataSeedContributor, ITransientDependency
{
    protected IDictCategoryRepository DictCategoryRepository { get; }

    protected IGuidGenerator GuidGenerator { get; }

    protected ICurrentTenant CurrentTenant { get; }
    public IDataFilter DataFilter { get; }

    public DataDictionaryDataSeedContributor(
        IDictCategoryRepository dictCategoryRepository,
        IGuidGenerator guidGenerator,
        ICurrentTenant currentTenant,
        IDataFilter dataFilter)
    {
        DictCategoryRepository = dictCategoryRepository;
        GuidGenerator = guidGenerator;
        CurrentTenant = currentTenant;
        DataFilter = dataFilter;
    }

    [UnitOfWork]
    public async Task SeedAsync(DataSeedContext context)
    {
        using (DataFilter.Disable<IDataPermission>())
        using (CurrentTenant.Change(context.TenantId))
        {
            var dictCategories = new List<DictCategory>()
            {
                new DictCategory(GuidGenerator.Create(), "Sex", "性别", Enable.Enabled, 1, "性别", "性别",string.Empty,null,context.TenantId, string.Empty)
            };

            foreach (var dictCategory in dictCategories)
            {
                dictCategory.Items = new List<DictItem>()
                {
                    new DictItem(GuidGenerator.Create(), dictCategory.Id, "Male", "0", "男", Enable.Enabled, 0, "男",
                        string.Empty, string.Empty, null,context.TenantId, string.Empty),
                    new DictItem(GuidGenerator.Create(), dictCategory.Id, "Female", "1", "女",Enable.Enabled, 2, "女",
                        string.Empty, string.Empty,null, context.TenantId, string.Empty)
                };
            }

            var existsPermissionGrants = (await DictCategoryRepository.GetListAsync()).Select(x => x.Key).ToList();
            foreach (var dictCategory in dictCategories.Where(dictCategory => !existsPermissionGrants.Contains(dictCategory.Key)))
            {
                await DictCategoryRepository.InsertAsync(dictCategory);
            }
        }
    }
}