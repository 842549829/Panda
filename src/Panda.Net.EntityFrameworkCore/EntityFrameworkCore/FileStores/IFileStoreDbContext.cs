using Microsoft.EntityFrameworkCore;
using Panda.Net.Bases.FileStores;
using Volo.Abp.EntityFrameworkCore;

namespace Panda.Net.EntityFrameworkCore.FileStores;

public interface IFileStoreDbContext :
    IEfCoreDbContext
{
    DbSet<FileStore> FileStores { get;  }

    DbSet<FileProjectName> FileProjectNames { get;  }

    DbSet<FileWhiteList> FileWhiteLists { get;  }
}