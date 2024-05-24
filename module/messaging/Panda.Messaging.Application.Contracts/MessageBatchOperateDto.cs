using System.ComponentModel.DataAnnotations;
using Volo.Abp.Application.Dtos;

namespace Panda.Messaging.Application.Contracts;

/// <summary>
/// 数据模型：消息批量操作
/// </summary>
public class MessageBatchOperateDto : EntityDto
{
    [Required] 
    public Guid[] MessageIds { get; set; }
}