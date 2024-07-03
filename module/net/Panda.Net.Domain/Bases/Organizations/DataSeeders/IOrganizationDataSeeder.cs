using System;
using System.Threading.Tasks;

namespace Panda.Net.Bases.Organizations.DataSeeders;

public interface IOrganizationDataSeeder
{
    Task SeedAsync(
        Guid? tenantId = null
    );
}