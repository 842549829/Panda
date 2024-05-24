using Microsoft.EntityFrameworkCore;
using Panda.Net.Bases.FileStores.Repositories;
using Panda.Net.EntityFrameworkCore;
using System;
using System.Threading.Tasks;
using Volo.Abp.Domain.Repositories.EntityFrameworkCore;
using Volo.Abp.EntityFrameworkCore;

namespace Panda.Net.Bases.FileStores;

public class FileProjectNameRepository : EfCoreRepository<NetDbContext, FileProjectName, Guid>, IFileProjectNameRepository
{
    public FileProjectNameRepository(IDbContextProvider<NetDbContext> dbContextProvider) : base(dbContextProvider)
    {
    }

    public async Task<FileProjectName?> GetFileProjectNameAsync(string projectName)
    {
        return await (await GetDbSetAsync()).FirstOrDefaultAsync(a => a.ProjectName == projectName);
    }
}