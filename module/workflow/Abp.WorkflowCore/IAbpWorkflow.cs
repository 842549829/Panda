using Abp.Workflow;
using WorkflowCore.Interface;

namespace Abp.WorkflowCore;

public interface IAbpWorkflow : IWorkflow<WorkflowParamDictionary>
{
}