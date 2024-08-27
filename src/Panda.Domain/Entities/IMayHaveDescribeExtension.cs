namespace Panda.Domain.Entities;

public interface IMayHaveDescribeExtension: IMayHaveDescribe
{
    public void SetDescribe(string? describe);
}