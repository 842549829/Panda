using Panda.DataPermission.EntityFrameworkCore.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Panda.DataSend.EntityFrameworkCore.DbContext;

public class DataSendDbContext(DbContextOptions<DataSendDbContext> options)
    : DataPermissionDbContext<DataSendDbContext>(options), IDataSendDbContext;