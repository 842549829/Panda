using System.Threading.Tasks;
using Panda.Net.Bases.FileStores.Repositories;
using Volo.Abp.Data;
using Volo.Abp.DependencyInjection;

namespace Panda.Net.Bases.FileStores.DataSeeders;

public class FileDataSeeder : IDataSeedContributor, ITransientDependency
{
    private readonly IFileWhiteListRepository _whiteListRepository;
    private readonly IFileProjectNameRepository _fileProjectNameRepository;

    public FileDataSeeder(IFileWhiteListRepository whiteListRepository,
        IFileProjectNameRepository fileProjectNameRepository)
    {
        _whiteListRepository = whiteListRepository;
        _fileProjectNameRepository = fileProjectNameRepository;
    }

    public async Task SeedAsync(DataSeedContext context)
    {
        var tenantId = context.TenantId;

        if (await _whiteListRepository.GetCountAsync() <= 0)
        {
            await _whiteListRepository.InsertAsync(new FileWhiteList { TenantId = tenantId, Extension = ".png" });
        }
        if (await _fileProjectNameRepository.GetCountAsync() <= 0)
        {
            await _fileProjectNameRepository.InsertAsync(new FileProjectName { TenantId = tenantId, ProjectName = "omg" });
        }
    }
}