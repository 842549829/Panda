using Microsoft.EntityFrameworkCore;
using Panda.Net.Bases.Announcements.Entities;
using Volo.Abp.EntityFrameworkCore.Modeling;
using Volo.Abp.Identity;

namespace Panda.Net.EntityFrameworkCore;

public static class NetDbContextModelCreatingExtensions
{
    public static void ConfigureBasic(this ModelBuilder builder)
    {
        builder.Entity<Announcement>(b =>
        {
            b.ToTable(AbpIdentityDbProperties.DbTablePrefix + "Announcements", t =>
            {
                t.HasComment("公告");
            });
            b.Property(a => a.Title).IsRequired().HasMaxLength(50);
            b.Property(a => a.PublishType).IsRequired();
            b.HasKey(c => c.Id);

            b.ConfigureByConvention();
            b.ApplyObjectExtensionMappings();
        });
    }
}