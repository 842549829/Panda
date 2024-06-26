﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Panda.Messaging.EntityFrameworkCore.EntityFrameworkCore.DbContext;
using Volo.Abp.EntityFrameworkCore;

#nullable disable

namespace Panda.Messaging.EntityFrameworkCore.Migrations
{
    [DbContext(typeof(MessageDbContext))]
    [Migration("20240407024306_msg")]
    partial class msg
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("_Abp_DatabaseProvider", EfCoreDatabaseProvider.MySql)
                .HasAnnotation("ProductVersion", "8.0.0")
                .HasAnnotation("Relational:MaxIdentifierLength", 64);

            modelBuilder.Entity("Panda.Messaging.Domain.Entities.Message", b =>
                {
                    b.Property<Guid>("Id")
                        .HasColumnType("char(36)");

                    b.Property<string>("ApplicationName")
                        .IsRequired()
                        .HasMaxLength(36)
                        .HasColumnType("varchar(36)")
                        .HasComment("所属系统名称（消息发起系统）");

                    b.Property<string>("ConcurrencyStamp")
                        .IsConcurrencyToken()
                        .IsRequired()
                        .HasMaxLength(40)
                        .HasColumnType("varchar(40)")
                        .HasColumnName("ConcurrencyStamp");

                    b.Property<string>("Content")
                        .IsRequired()
                        .HasMaxLength(4010)
                        .HasColumnType("varchar(4010)")
                        .HasComment("消息内容");

                    b.Property<DateTime>("CreationTime")
                        .HasColumnType("datetime(6)")
                        .HasColumnName("CreationTime");

                    b.Property<Guid?>("CreatorId")
                        .HasColumnType("char(36)")
                        .HasColumnName("CreatorId");

                    b.Property<bool>("DelayedSend")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("tinyint(1)")
                        .HasDefaultValue(false)
                        .HasComment("是否定时发送（延迟发送）0：否 1：是");

                    b.Property<Guid?>("DeleterId")
                        .HasColumnType("char(36)")
                        .HasColumnName("DeleterId");

                    b.Property<DateTime?>("DeletionTime")
                        .HasColumnType("datetime(6)")
                        .HasColumnName("DeletionTime");

                    b.Property<DateTime?>("ExpirationTime")
                        .HasColumnType("datetime(6)")
                        .HasComment("到期时间（到期后收件人不可查看）");

                    b.Property<string>("ExtraProperties")
                        .IsRequired()
                        .HasColumnType("longtext")
                        .HasColumnName("ExtraProperties");

                    b.Property<bool>("IsDeleted")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("tinyint(1)")
                        .HasDefaultValue(false)
                        .HasColumnName("IsDeleted");

                    b.Property<DateTime?>("LastModificationTime")
                        .HasColumnType("datetime(6)")
                        .HasColumnName("LastModificationTime");

                    b.Property<Guid?>("LastModifierId")
                        .HasColumnType("char(36)")
                        .HasColumnName("LastModifierId");

                    b.Property<int>("MessageType")
                        .HasColumnType("int")
                        .HasComment("消息类型 1：通知，2：预警，99：其他 ...");

                    b.Property<int>("PushProviderCode")
                        .HasColumnType("int")
                        .HasComment("消息推送方式 1：系统消息，2：短信消息，4：邮件消息 ...");

                    b.Property<DateTime?>("RecalledTime")
                        .HasColumnType("datetime(6)")
                        .HasComment("撤回时间");

                    b.Property<Guid?>("RecalledUserId")
                        .HasColumnType("char(36)")
                        .HasComment("撤回人Id");

                    b.Property<string>("RecalledUserName")
                        .HasMaxLength(64)
                        .HasColumnType("varchar(64)")
                        .HasComment("撤回人Id");

                    b.Property<DateTime>("SendTime")
                        .HasColumnType("datetime(6)")
                        .HasComment("发送时间");

                    b.Property<Guid>("SendUserId")
                        .HasColumnType("char(36)")
                        .HasComment("发送人Id");

                    b.Property<string>("SendUserName")
                        .IsRequired()
                        .HasMaxLength(64)
                        .HasColumnType("varchar(64)")
                        .HasComment("发送人姓名");

                    b.Property<int>("Status")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasDefaultValue(1)
                        .HasComment("消息状态 1：已发布，2：已发送，3：已撤回");

                    b.Property<long?>("Tag")
                        .HasColumnType("bigint")
                        .HasComment("标签 二进制编码，用于扩展");

                    b.Property<string>("Title")
                        .IsRequired()
                        .HasMaxLength(256)
                        .HasColumnType("varchar(256)")
                        .HasComment("消息标题");

                    b.HasKey("Id");

                    b.HasIndex("ApplicationName", "MessageType", "Title");

                    b.ToTable("YaDeaMessages", (string)null);
                });

            modelBuilder.Entity("Panda.Messaging.Domain.Entities.MessageNotification", b =>
                {
                    b.Property<Guid>("Id")
                        .HasColumnType("char(36)");

                    b.Property<bool>("IsRead")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("tinyint(1)")
                        .HasDefaultValue(false)
                        .HasComment("已读状态 0：未读，1：已读");

                    b.Property<Guid>("MessageId")
                        .HasColumnType("char(36)")
                        .HasComment("消息Id");

                    b.Property<Guid>("MessageScopingId")
                        .HasColumnType("char(36)")
                        .HasComment("消息范围Id");

                    b.Property<DateTime?>("ReadTime")
                        .HasColumnType("datetime(6)")
                        .HasComment("查阅时间");

                    b.Property<Guid>("UserId")
                        .HasColumnType("char(36)")
                        .HasComment("用户Id");

                    b.HasKey("Id");

                    b.HasIndex("MessageId");

                    b.HasIndex("MessageScopingId");

                    b.HasIndex("UserId", "MessageScopingId", "MessageId", "IsRead");

                    b.ToTable("YaDeaMessageNotifications", (string)null);
                });

            modelBuilder.Entity("Panda.Messaging.Domain.Entities.MessageScope", b =>
                {
                    b.Property<Guid>("Id")
                        .HasColumnType("char(36)");

                    b.Property<Guid>("MessageId")
                        .HasColumnType("char(36)")
                        .HasComment("消息Id");

                    b.Property<string>("ProviderKey")
                        .IsRequired()
                        .HasMaxLength(64)
                        .HasColumnType("varchar(64)")
                        .HasComment("关联提供商类型名称（S：All，A：Number，O：Number，D：Number，R：RoleName，G：Number，U：UserName）");

                    b.Property<string>("ProviderName")
                        .IsRequired()
                        .HasMaxLength(64)
                        .HasColumnType("varchar(64)")
                        .HasComment("关联提供商类型（S：全局系统消息，A：系统，O：机构/部门，R：角色，G：群组，U：用户）");

                    b.HasKey("Id");

                    b.HasIndex("MessageId", "ProviderName", "ProviderKey");

                    b.ToTable("YaDeaMessageScopes", (string)null);
                });

            modelBuilder.Entity("Volo.Abp.BackgroundJobs.BackgroundJobRecord", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("char(36)");

                    b.Property<string>("ConcurrencyStamp")
                        .IsConcurrencyToken()
                        .IsRequired()
                        .HasMaxLength(40)
                        .HasColumnType("varchar(40)")
                        .HasColumnName("ConcurrencyStamp");

                    b.Property<DateTime>("CreationTime")
                        .HasColumnType("datetime(6)")
                        .HasColumnName("CreationTime");

                    b.Property<string>("ExtraProperties")
                        .IsRequired()
                        .HasColumnType("longtext")
                        .HasColumnName("ExtraProperties");

                    b.Property<bool>("IsAbandoned")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("tinyint(1)")
                        .HasDefaultValue(false);

                    b.Property<string>("JobArgs")
                        .IsRequired()
                        .HasMaxLength(1048576)
                        .HasColumnType("longtext");

                    b.Property<string>("JobName")
                        .IsRequired()
                        .HasMaxLength(128)
                        .HasColumnType("varchar(128)");

                    b.Property<DateTime?>("LastTryTime")
                        .HasColumnType("datetime(6)");

                    b.Property<DateTime>("NextTryTime")
                        .HasColumnType("datetime(6)");

                    b.Property<byte>("Priority")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("tinyint unsigned")
                        .HasDefaultValue((byte)15);

                    b.Property<short>("TryCount")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("smallint")
                        .HasDefaultValue((short)0);

                    b.HasKey("Id");

                    b.HasIndex("IsAbandoned", "NextTryTime");

                    b.ToTable("AbpBackgroundJobs", (string)null);
                });

            modelBuilder.Entity("Panda.Messaging.Domain.Entities.MessageNotification", b =>
                {
                    b.HasOne("Panda.Messaging.Domain.Entities.Message", null)
                        .WithMany("Notifications")
                        .HasForeignKey("MessageId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Panda.Messaging.Domain.Entities.MessageScope", null)
                        .WithMany("Notifications")
                        .HasForeignKey("MessageScopingId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Panda.Messaging.Domain.Entities.MessageScope", b =>
                {
                    b.HasOne("Panda.Messaging.Domain.Entities.Message", null)
                        .WithMany("Scopes")
                        .HasForeignKey("MessageId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Panda.Messaging.Domain.Entities.Message", b =>
                {
                    b.Navigation("Notifications");

                    b.Navigation("Scopes");
                });

            modelBuilder.Entity("Panda.Messaging.Domain.Entities.MessageScope", b =>
                {
                    b.Navigation("Notifications");
                });
#pragma warning restore 612, 618
        }
    }
}
