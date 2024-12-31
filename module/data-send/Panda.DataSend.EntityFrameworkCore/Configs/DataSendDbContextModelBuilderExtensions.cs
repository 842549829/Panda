using Microsoft.EntityFrameworkCore;
using Volo.Abp;

namespace Panda.DataSend.EntityFrameworkCore.Configs;

public static class DataSendDbContextModelBuilderExtensions
{
    public static void ConfigureDataDictionary(this ModelBuilder builder)
    {
        Check.NotNull(builder, nameof(builder));
    }
}