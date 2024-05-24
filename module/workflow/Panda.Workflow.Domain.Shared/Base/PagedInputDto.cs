using System.ComponentModel.DataAnnotations;
using Volo.Abp.Application.Dtos;

namespace Panda.Workflow.Domain.Shared.Base;

public class PagedInputDto : IPagedResultRequest
{
    [Range(1, AppLtmConsts.MaxPageSize)]
    public int MaxResultCount { get; set; } = AppLtmConsts.DefaultPageSize;

    [Range(0, int.MaxValue)]
    public int SkipCount { get; set; }
}