using System.Threading.Tasks;
using Volo.Abp.Data;
using Volo.Abp.DependencyInjection;

namespace Panda.Net.Bases.Organizations.DataSeeders;

public class OrganizationDataSeedContributor(IOrganizationDataSeeder organizationDataSeeder)
    : IDataSeedContributor, ITransientDependency
{
    public Task SeedAsync(DataSeedContext context)
    {
        return organizationDataSeeder.SeedAsync(context?.TenantId);
    }
}