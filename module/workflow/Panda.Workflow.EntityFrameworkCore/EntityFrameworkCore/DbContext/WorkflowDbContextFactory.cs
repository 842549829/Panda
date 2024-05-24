using Microsoft.EntityFrameworkCore.Design;
using Microsoft.EntityFrameworkCore;

namespace Panda.Workflow.EntityFrameworkCore.EntityFrameworkCore.DbContext;

public class WorkflowDbContextFactory : IDesignTimeDbContextFactory<WorkflowDbContext>
{
    public WorkflowDbContext CreateDbContext(string[] args)
    {
        const string connection = "Server=localhost;Port=3306;Database=YaDea;Uid=root;Pwd=123456;";
        var builder = new DbContextOptionsBuilder<WorkflowDbContext>()
            .UseMySql(connection, MySqlServerVersion.LatestSupportedServerVersion);
        return new WorkflowDbContext(builder.Options);
    }
}
