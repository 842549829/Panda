using Volo.Abp.Data;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Guids;
using Volo.Abp.MultiTenancy;
using Volo.Abp.Uow;

namespace Panda.DataSend.DbMigrator.Data;

public class DataDictionaryDataSeedContributor(
    IGuidGenerator guidGenerator,
    ICurrentTenant currentTenant,
    IDataFilter dataFilter)
    : IDataSeedContributor, ITransientDependency
{

    protected IGuidGenerator GuidGenerator { get; } = guidGenerator;

    protected ICurrentTenant CurrentTenant { get; } = currentTenant;

    public IDataFilter DataFilter { get; } = dataFilter;


    [UnitOfWork]
    public Task SeedAsync(DataSeedContext context)
    {
        return Task.CompletedTask;
    }
}