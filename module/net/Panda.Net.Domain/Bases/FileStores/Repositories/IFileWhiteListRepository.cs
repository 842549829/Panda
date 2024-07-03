using System;
using System.Threading.Tasks;
using Volo.Abp.Domain.Repositories;

namespace Panda.Net.Bases.FileStores.Repositories;

public interface IFileWhiteListRepository : IBasicRepository<FileWhiteList, Guid>
{
    Task<FileWhiteList?> GetFileWhiteListAsync(string extension);
}