using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Panda.Messaging.Application.Contracts;
using System;
using System.Threading.Tasks;
using Volo.Abp.Application.Dtos;

namespace Panda.Net.Controllers.Bases;

[Route("api/basics/messaging/inbox")]
[ApiController]
[Authorize]
public class InboxController(IInboxAppService inboxAppService) : NetController
{
   
    [HttpGet("{id}")]
    public async Task<MessageReceivingDto> GetAsync(Guid id)
    {
        return await inboxAppService.GetAsync(id);
    }

    [HttpGet]
    public async Task<PagedResultDto<MessageReceivingListDto>> GetListAsync(
        [FromQuery] GetReceivedMessagesInputDto input)
    {
        return await inboxAppService.GetListAsync(input);
    }

    [HttpGet("unReadCount")]
    public async Task<long> GetUnReadCountAsync()
    {
        return await inboxAppService.GetUnReadCountAsync();
    }
   
    [HttpGet("{id}/readerCount")]
    public async Task<int> GetReaderCountAsync(Guid id)
    {
        return await inboxAppService.GetReaderCountAsync(id);
    }
 
    [HttpPut("markRead/{id}")]
    public async Task<bool> MarkReadAsync(Guid id)
    {
        await inboxAppService.MarkReadAsync(id);
        return true;
    }

    [HttpPost("batchMarkRead")]
    public async Task<bool> BatchMarkReadAsync([FromBody] MessageBatchOperateDto input)
    {
        await inboxAppService.BatchMarkReadAsync(input);
        return true;
    }

    [HttpPost("markAllRead")]
    public async Task<bool> MarkAllReadAsync()
    {
        await inboxAppService.MarkAllReadAsync();
        return true;
    }
}