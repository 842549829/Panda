using System;
using System.Threading.Tasks;
using Volo.Abp.Domain.Repositories;

namespace Panda.Net.Bases.FileStores.Repositories;

public interface IFileRepository : IBasicRepository<FileStore, Guid>
{
    Task<FileStore?> GetByMd5Async(string md5);
}