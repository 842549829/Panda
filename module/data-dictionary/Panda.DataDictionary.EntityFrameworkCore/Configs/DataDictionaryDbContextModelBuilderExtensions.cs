using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Panda.DataDictionary.Domain.DataDictionaries;
using Panda.DataDictionary.Domain.DataDictionaries.Entities;
using Panda.DataDictionary.EntityFrameworkCore.DbContext;
using Panda.Domain.Shared.Consts;
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
                .HasMaxLength(PandaConsts.MaxLength512)
                .HasColumnName(nameof(DictCategory.Alias));

            b.HasMany(a => a.Items)
                .WithOne(a => a.Category)
                .HasForeignKey(a => a.CategoryId)
                .OnDelete(DeleteBehavior.Cascade);  

            b.ApplyObjectExtensionMappings();
        });

        builder.Entity<DictItem>(b =>
        {
            b.ToTable(DataDictionaryDbProperties.DbTablePrefix + "DictItem", DataDictionaryDbProperties.DbSchema);

            b.ConfigureByConvention();

            b.ConfigureDictEntity();

            b.Property(u => u.CategoryId).IsRequired()
                .HasColumnName(nameof(DictItem.CategoryId));

            b.Property(u => u.Style).IsRequired()
                .HasMaxLength(PandaConsts.MaxLength512)
                .HasColumnName(nameof(DictItem.Style));

            b.Property(u => u.Value).IsRequired()
                .HasMaxLength(PandaConsts.MaxLength16)
                .HasColumnName(nameof(DictItem.Value));

            b.ApplyObjectExtensionMappings();
        });


        builder.TryConfigureObjectExtensions<DataDictionaryDbContext>();
    }


    public static void ConfigureDictEntity<TEntity>(this EntityTypeBuilder<TEntity> b) where TEntity : DictEntity
    {
        b.Property(x => x.Id).ValueGeneratedNever();

        b.Property(u => u.Name).IsRequired()
            .HasMaxLength(PandaConsts.MaxLength256)
            .HasColumnName(nameof(DictEntity.Name));

        b.Property(u => u.Code).IsRequired()
            .HasMaxLength(PandaConsts.MaxLength95)
            .HasColumnName(nameof(DictEntity.Code));

        b.Property(u => u.ParnetId).IsRequired(false)
            .HasColumnName(nameof(DictEntity.ParnetId));

        b.Property(u => u.TenantId).IsRequired(false)
            .HasColumnName(nameof(DictEntity.TenantId));

        b.Property(u => u.Status).IsRequired()
            .HasColumnName(nameof(DictEntity.Status));

        b.Property(u => u.Key).IsRequired()
            .HasMaxLength(PandaConsts.MaxLength32)
            .HasColumnName(nameof(DictEntity.Key));

        b.Property(u => u.Describe).IsRequired()
            .HasMaxLength(PandaConsts.MaxLength512)
            .HasColumnName(nameof(DictEntity.Describe));

        b.Property(u => u.Sort).IsRequired()
            .HasColumnName(nameof(DictEntity.Sort));

        b.HasIndex(u => u.Code);
        b.HasIndex(u => u.Name);
        b.HasIndex(u => u.Key);
        //.IsUnique();
    }
}