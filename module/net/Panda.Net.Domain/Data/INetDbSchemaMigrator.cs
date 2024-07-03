using System.Threading.Tasks;

namespace Panda.Net.Data;

public interface INetDbSchemaMigrator
{
    Task MigrateAsync();
}
