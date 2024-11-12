using Microsoft.EntityFrameworkCore;
using Panda.Net.Bases.Announcements.Entities;
using Panda.Net.Bases.Departments;
using Panda.Net.Bases.Users.Entities;
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

            b.Property(a => a.OrganizationCode).IsRequired().HasMaxLength(4096).HasDefaultValue(string.Empty);

            b.ConfigureByConvention();
            b.ApplyObjectExtensionMappings();
        });


        builder.Entity<Department>(b =>
        {
            b.ToTable(AbpIdentityDbProperties.DbTablePrefix + nameof(Department), t =>
            {
                t.HasComment("部门");
            });


            b.HasOne(a => a.DepartmentType).WithMany().HasForeignKey(a => a.DepartmentTypeId)
                .IsRequired();

            b.ConfigureByConvention();
            b.ApplyObjectExtensionMappings();
        });

        builder.Entity<Doctor>(b =>
        {
            b.ToTable(AbpIdentityDbProperties.DbTablePrefix + nameof(Doctor), t =>
            {
                t.HasComment("Doctor");
            });

            b.ConfigureByConvention();
            b.ApplyObjectExtensionMappings();
        });
    }
}