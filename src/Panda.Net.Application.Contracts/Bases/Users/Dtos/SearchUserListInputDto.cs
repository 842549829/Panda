using System;
using System.Collections.Generic;

namespace Panda.Net.Bases.Users.Dtos;

public class SearchUserListInputDto
{
    public string? Sorting { get; set; }

    public string? Filter { get; set; }

    public int MaxResultCount { get; set; } = 10;

    public IEnumerable<Guid> UserIds { get; set; } = new List<Guid>();
}