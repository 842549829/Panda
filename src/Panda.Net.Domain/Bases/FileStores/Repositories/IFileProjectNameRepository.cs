using System;
using System.Threading.Tasks;
using Volo.Abp.Domain.Repositories;

namespace Panda.Net.Bases.FileStores.Repositories;

public interface IFileProjectNameRepository : IBasicRepository<FileProjectName, Guid>
{
    Task<FileProjectName?> GetFileProjectNameAsync(string projectName);
}