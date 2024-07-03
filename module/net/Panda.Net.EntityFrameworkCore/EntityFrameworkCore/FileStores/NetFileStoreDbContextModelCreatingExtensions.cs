using Microsoft.EntityFrameworkCore;
using Panda.Net.Bases.FileStores;
using Panda.Net.FIleStores;
using Volo.Abp;
using Volo.Abp.EntityFrameworkCore.Modeling;
using Volo.Abp.Identity;

namespace Panda.Net.EntityFrameworkCore.FileStores;

public static class NetFileStoreDbContextModelCreatingExtensions
{
    public static void ConfigureFileStoreManagement(this ModelBuilder builder)
    {
        Check.NotNull(builder, nameof(builder));
        builder.Entity<FileStore>(b =>
        {
            b.ToTable(AbpIdentityDbProperties.DbTablePrefix + "files", AbpIdentityDbProperties.DbSchema);
            b.ConfigureByConvention();

            b.Property(a => a.Name).IsRequired().HasMaxLength(FileStoreConsts.MaxFileStoreNameLength);
            b.Property(a => a.Md5).IsRequired().HasMaxLength(FileStoreConsts.MaxFileStoreMd5Length);
            b.Property(a => a.Extension).IsRequired().HasMaxLength(FileStoreConsts.MaxFileStoreExtensionLength);
            b.Property(a => a.Path).IsRequired().HasMaxLength(FileStoreConsts.MaxFileStorePathLength);
            b.Property(a => a.ProjectName).IsRequired().HasMaxLength(FileStoreConsts.MaxFileStoreProjectNameLength);
            
            b.HasIndex(u => u.Md5);
            b.ApplyObjectExtensionMappings();
        });

        builder.Entity<FileProjectName>(b =>
        {
            b.ToTable(AbpIdentityDbProperties.DbTablePrefix + "FilesProjectName", AbpIdentityDbProperties.DbSchema);
            b.Property(a => a.ProjectName).IsRequired().HasMaxLength(FileStoreConsts.MaxFileStoreProjectNameLength);
            b.HasIndex(u => u.ProjectName);
            b.ConfigureByConvention();
            b.ApplyObjectExtensionMappings();
        });

        builder.Entity<FileWhiteList>(b =>
        {
            b.ToTable(AbpIdentityDbProperties.DbTablePrefix + "FilesWhiteList", AbpIdentityDbProperties.DbSchema);
            b.Property(a => a.Extension).IsRequired().HasMaxLength(FileStoreConsts.MaxFileStoreExtensionLength);
            b.HasIndex(u => u.Extension);
            b.ConfigureByConvention();
            b.ApplyObjectExtensionMappings();
        });
    }
}
