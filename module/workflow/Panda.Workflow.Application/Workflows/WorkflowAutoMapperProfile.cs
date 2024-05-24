using Abp.Workflow;
using AutoMapper;
using Panda.Workflow.Application.Contracts.Workflows.Dtos;

namespace Panda.Workflow.Application.Workflows;

public class WorkflowAutoMapperProfile : Profile
{
    public WorkflowAutoMapperProfile()
    {
        CreateMap<WorkflowDesignInfo, PersistedWorkflowDefinition>().ReverseMap();
    }
}