using Panda.DataSend.Domain.DataSends;
using Volo.Abp.Data;
using Volo.Abp.EntityFrameworkCore;

namespace Panda.DataSend.EntityFrameworkCore.DbContext;

[ConnectionStringName(DataSendDbProperties.ConnectionStringName)]
public interface IDataSendDbContext : IEfCoreDbContext
{
}