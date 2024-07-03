using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Panda.DataDictionary.Domain.DataDictionaries;
using Panda.DataDictionary.Domain.DataDictionaries.Entities;
using Panda.DataDictionary.EntityFrameworkCore.DbContext;
using Volo.Abp;
using Volo.Abp.EntityFrameworkCore.Modeling;

namespace Panda.DataDictionary.EntityFrameworkCore.Configs;

public static class DataDictionaryDbContextModelBuilderExtensions
{
    public static void ConfigureDataDictionary(this ModelBuilder builder)
    {
        Check.NotNull(builder, nameof(builder));

        builder.Entity<DictCategory>(b =>
        {
            b.ToTable(DataDictionaryDbProperties.DbTablePrefix + "DictCategory", DataDictionaryDbProperties.DbSchema);

            b.ConfigureByConvention();

            b.ConfigureDictEntity();

            b.Property(u => u.Alias).IsRequired()
                .HasMaxLength(512)
                .HasColumnName(nameof(DictCategory.Alias));

            b.ApplyObjectExtensionMappings();
        });

        builder.Entity<DictItem>(b =>
        {
            b.ToTable(DataDictionaryDbProperties.DbTablePrefix + "DictItem", DataDictionaryDbProperties.DbSchema);

            b.ConfigureByConvention();

            b.ConfigureDictEntity();

            b.Property(u => u.Style).IsRequired()
                .HasMaxLength(512)
                .HasColumnName(nameof(DictItem.Style));

            b.Property(u => u.Value).IsRequired()
                .HasMaxLength(16)
                .HasColumnName(nameof(DictItem.Value));

            b.ApplyObjectExtensionMappings();
        });
        

        builder.TryConfigureObjectExtensions<DataDictionaryDbContext>();
    }


    public static void ConfigureDictEntity<TEntity>(this EntityTypeBuilder<TEntity> b) where TEntity : DictEntity
    {
        b.Property(x => x.Id).ValueGeneratedNever();

        b.Property(u => u.Name).IsRequired()
            .HasMaxLength(256)
            .HasColumnName(nameof(DictEntity.Name));

        b.Property(u => u.Code).IsRequired()
            .HasMaxLength(4096)
            .HasColumnName(nameof(DictEntity.Code));

        b.Property(u => u.ParnetId).IsRequired(false)
            .HasColumnName(nameof(DictEntity.ParnetId));

        b.Property(u => u.TenantId).IsRequired(false)
            .HasColumnName(nameof(DictEntity.TenantId));

        b.Property(u => u.Status).IsRequired()
            .HasColumnName(nameof(DictEntity.Status));

        b.Property(u => u.Key).IsRequired()
            .HasMaxLength(32)
            .HasColumnName(nameof(DictEntity.Key));

        b.Property(u => u.Describe).IsRequired()
            .HasMaxLength(512)
            .HasColumnName(nameof(DictEntity.Describe));

        b.Property(u => u.Sort).IsRequired()
            .HasColumnName(nameof(DictEntity.Sort));

        b.HasIndex(u => u.Code);
        b.HasIndex(u => u.Name);
        b.HasIndex(u => u.Key)
            .IsUnique();
    }
}