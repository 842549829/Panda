using Microsoft.EntityFrameworkCore;
using Panda.Messaging.Domain.Entities;

namespace Panda.Messaging.EntityFrameworkCore.EntityFrameworkCore.DbContext;

public static class MessagingEfCoreQueryableExtensions
{
    public static IQueryable<Message> IncludeDetails(
        this IQueryable<Message> queryable,
        bool include = true)
    {
        if (!include)
        {
            return queryable;
        }

        return queryable
            .Include(m => m.Scopes)
            .Include(m => m.Notifications);
    }
}