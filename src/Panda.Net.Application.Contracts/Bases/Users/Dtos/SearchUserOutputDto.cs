using System;
using Volo.Abp.Application.Dtos;

namespace Panda.Net.Bases.Users.Dtos;

public class SearchUserOutputDto : EntityDto<Guid>
{
    public string UserName { get; set; } = default!;

    public string FullName { get; set; } = default!;
}