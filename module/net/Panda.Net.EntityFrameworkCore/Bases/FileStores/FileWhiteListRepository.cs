using Microsoft.EntityFrameworkCore;
using Panda.Net.Bases.FileStores.Repositories;
using Panda.Net.EntityFrameworkCore;
using System;
using System.Threading.Tasks;
using Volo.Abp.Domain.Repositories.EntityFrameworkCore;
using Volo.Abp.EntityFrameworkCore;

namespace Panda.Net.Bases.FileStores;

public class FileWhiteListRepository : EfCoreRepository<NetDbContext, FileWhiteList, Guid>, IFileWhiteListRepository
{
    public FileWhiteListRepository(IDbContextProvider<NetDbContext> dbContextProvider) : base(dbContextProvider)
    {
    }

    public async Task<FileWhiteList?> GetFileWhiteListAsync(string extension)
    {
        return await (await GetDbSetAsync()).FirstOrDefaultAsync(a => a.Extension == extension);
    }
}