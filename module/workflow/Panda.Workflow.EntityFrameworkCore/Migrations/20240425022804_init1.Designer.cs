﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Panda.Workflow.EntityFrameworkCore.EntityFrameworkCore.DbContext;
using Volo.Abp.EntityFrameworkCore;

#nullable disable

namespace Panda.Workflow.EntityFrameworkCore.Migrations
{
    [DbContext(typeof(WorkflowDbContext))]
    [Migration("20240425022804_init1")]
    partial class init1
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("_Abp_DatabaseProvider", EfCoreDatabaseProvider.MySql)
                .HasAnnotation("ProductVersion", "8.0.0")
                .HasAnnotation("Relational:MaxIdentifierLength", 64);

            modelBuilder.Entity("Abp.Workflow.PersistedWorkflowDefinition", b =>
                {
                    b.Property<string>("Id")
                        .HasMaxLength(100)
                        .HasColumnType("varchar(100)");

                    b.Property<int>("Version")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasDefaultValue(1);

                    b.Property<string>("Color")
                        .HasMaxLength(50)
                        .HasColumnType("varchar(50)");

                    b.Property<DateTime>("CreationTime")
                        .HasColumnType("datetime(6)")
                        .HasColumnName("CreationTime");

                    b.Property<Guid?>("CreatorId")
                        .HasColumnType("char(36)")
                        .HasColumnName("CreatorId");

                    b.Property<Guid?>("DeleterId")
                        .HasColumnType("char(36)")
                        .HasColumnName("DeleterId");

                    b.Property<DateTime?>("DeletionTime")
                        .HasColumnType("datetime(6)")
                        .HasColumnName("DeletionTime");

                    b.Property<string>("Description")
                        .HasColumnType("longtext");

                    b.Property<string>("Group")
                        .IsRequired()
                        .HasMaxLength(100)
                        .HasColumnType("varchar(100)");

                    b.Property<string>("Icon")
                        .HasMaxLength(50)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("Inputs")
                        .IsRequired()
                        .HasColumnType("longtext");

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

                    b.Property<string>("Nodes")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.Property<Guid?>("TenantId")
                        .HasColumnType("char(36)")
                        .HasColumnName("TenantId");

                    b.Property<string>("Title")
                        .IsRequired()
                        .HasMaxLength(256)
                        .HasColumnType("varchar(256)");

                    b.HasKey("Id", "Version");

                    b.ToTable("WorkflowDefinitions");
                });

            modelBuilder.Entity("Abp.WorkflowCore.Persistence.PersistedEvent", b =>
                {
                    b.Property<Guid>("Id")
                        .HasColumnType("char(36)");

                    b.Property<DateTime>("CreationTime")
                        .HasColumnType("datetime(6)")
                        .HasColumnName("CreationTime");

                    b.Property<Guid?>("CreatorId")
                        .HasColumnType("char(36)")
                        .HasColumnName("CreatorId");

                    b.Property<string>("EventData")
                        .HasColumnType("longtext");

                    b.Property<string>("EventKey")
                        .HasMaxLength(200)
                        .HasColumnType("varchar(200)");

                    b.Property<string>("EventName")
                        .HasMaxLength(200)
                        .HasColumnType("varchar(200)");

                    b.Property<DateTime>("EventTime")
                        .HasColumnType("datetime(6)");

                    b.Property<bool>("IsProcessed")
                        .HasColumnType("tinyint(1)");

                    b.Property<Guid?>("TenantId")
                        .HasColumnType("char(36)")
                        .HasColumnName("TenantId");

                    b.HasKey("Id");

                    b.ToTable("WorkflowEvents");
                });

            modelBuilder.Entity("Abp.WorkflowCore.Persistence.PersistedExecutionError", b =>
                {
                    b.Property<Guid>("Id")
                        .HasColumnType("char(36)");

                    b.Property<DateTime>("ErrorTime")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("ExecutionPointerId")
                        .IsRequired()
                        .HasMaxLength(100)
                        .HasColumnType("varchar(100)");

                    b.Property<string>("Message")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.Property<string>("WorkflowId")
                        .IsRequired()
                        .HasMaxLength(100)
                        .HasColumnType("varchar(100)");

                    b.HasKey("Id");

                    b.ToTable("WorkflowExecutionErrors");
                });

            modelBuilder.Entity("Abp.WorkflowCore.Persistence.PersistedExecutionPointer", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("varchar(255)");

                    b.Property<bool>("Active")
                        .HasColumnType("tinyint(1)");

                    b.Property<string>("Children")
                        .HasColumnType("longtext");

                    b.Property<string>("ContextItem")
                        .HasColumnType("longtext");

                    b.Property<DateTime?>("EndTime")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("EventData")
                        .HasColumnType("longtext");

                    b.Property<string>("EventKey")
                        .HasMaxLength(100)
                        .HasColumnType("varchar(100)");

                    b.Property<string>("EventName")
                        .HasMaxLength(100)
                        .HasColumnType("varchar(100)");

                    b.Property<bool>("EventPublished")
                        .HasColumnType("tinyint(1)");

                    b.Property<string>("Outcome")
                        .HasColumnType("longtext");

                    b.Property<string>("PersistenceData")
                        .HasColumnType("longtext");

                    b.Property<string>("PredecessorId")
                        .HasMaxLength(100)
                        .HasColumnType("varchar(100)");

                    b.Property<int>("RetryCount")
                        .HasColumnType("int");

                    b.Property<string>("Scope")
                        .HasColumnType("longtext");

                    b.Property<DateTime?>("SleepUntil")
                        .HasColumnType("datetime(6)");

                    b.Property<DateTime?>("StartTime")
                        .HasColumnType("datetime(6)");

                    b.Property<int>("Status")
                        .HasColumnType("int");

                    b.Property<int>("StepId")
                        .HasColumnType("int");

                    b.Property<string>("StepName")
                        .HasMaxLength(100)
                        .HasColumnType("varchar(100)");

                    b.Property<Guid>("WorkflowId")
                        .HasColumnType("char(36)");

                    b.HasKey("Id");

                    b.HasIndex("WorkflowId");

                    b.ToTable("WorkflowExecutionPointers");
                });

            modelBuilder.Entity("Abp.WorkflowCore.Persistence.PersistedExtensionAttribute", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint");

                    b.Property<string>("AttributeKey")
                        .IsRequired()
                        .HasMaxLength(100)
                        .HasColumnType("varchar(100)");

                    b.Property<string>("AttributeValue")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.Property<string>("ExecutionPointerId")
                        .IsRequired()
                        .HasColumnType("varchar(255)");

                    b.HasKey("Id");

                    b.HasIndex("ExecutionPointerId");

                    b.ToTable("WorkflowExtensionAttributes");
                });

            modelBuilder.Entity("Abp.WorkflowCore.Persistence.PersistedSubscription", b =>
                {
                    b.Property<Guid>("Id")
                        .HasColumnType("char(36)");

                    b.Property<string>("EventKey")
                        .IsRequired()
                        .HasMaxLength(200)
                        .HasColumnType("varchar(200)");

                    b.Property<string>("EventName")
                        .IsRequired()
                        .HasMaxLength(200)
                        .HasColumnType("varchar(200)");

                    b.Property<string>("ExecutionPointerId")
                        .IsRequired()
                        .HasMaxLength(200)
                        .HasColumnType("varchar(200)");

                    b.Property<string>("ExternalToken")
                        .HasMaxLength(200)
                        .HasColumnType("varchar(200)");

                    b.Property<DateTime?>("ExternalTokenExpiry")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("ExternalWorkerId")
                        .HasMaxLength(200)
                        .HasColumnType("varchar(200)");

                    b.Property<int>("StepId")
                        .HasColumnType("int");

                    b.Property<DateTime>("SubscribeAsOf")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("SubscriptionData")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.Property<string>("WorkflowId")
                        .IsRequired()
                        .HasMaxLength(200)
                        .HasColumnType("varchar(200)");

                    b.HasKey("Id");

                    b.ToTable("WorkflowSubscriptions");
                });

            modelBuilder.Entity("Abp.WorkflowCore.Persistence.PersistedWorkflow", b =>
                {
                    b.Property<Guid>("Id")
                        .HasColumnType("char(36)");

                    b.Property<DateTime?>("CompleteTime")
                        .HasColumnType("datetime(6)");

                    b.Property<DateTime>("CreateTime")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("CreateUserIdentityName")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.Property<DateTime>("CreationTime")
                        .HasColumnType("datetime(6)")
                        .HasColumnName("CreationTime");

                    b.Property<Guid?>("CreatorId")
                        .HasColumnType("char(36)")
                        .HasColumnName("CreatorId");

                    b.Property<string>("Data")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.Property<Guid?>("DeleterId")
                        .HasColumnType("char(36)")
                        .HasColumnName("DeleterId");

                    b.Property<DateTime?>("DeletionTime")
                        .HasColumnType("datetime(6)")
                        .HasColumnName("DeletionTime");

                    b.Property<string>("Description")
                        .IsRequired()
                        .HasMaxLength(500)
                        .HasColumnType("varchar(500)");

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

                    b.Property<long?>("NextExecution")
                        .HasColumnType("bigint");

                    b.Property<string>("Reference")
                        .IsRequired()
                        .HasMaxLength(200)
                        .HasColumnType("varchar(200)");

                    b.Property<int>("Status")
                        .HasColumnType("int");

                    b.Property<Guid?>("TenantId")
                        .HasColumnType("char(36)")
                        .HasColumnName("TenantId");

                    b.Property<int>("Version")
                        .HasColumnType("int");

                    b.Property<string>("WorkflowDefinitionId")
                        .IsRequired()
                        .HasMaxLength(100)
                        .HasColumnType("varchar(100)");

                    b.HasKey("Id");

                    b.HasIndex("WorkflowDefinitionId", "Version");

                    b.ToTable("Workflows");
                });

            modelBuilder.Entity("Panda.Workflow.Domain.Workflows.Entities.PersistedWorkflowAuditor", b =>
                {
                    b.Property<Guid>("Id")
                        .HasColumnType("char(36)");

                    b.Property<DateTime?>("AuditTime")
                        .HasColumnType("datetime(6)");

                    b.Property<DateTime>("CreationTime")
                        .HasColumnType("datetime(6)")
                        .HasColumnName("CreationTime");

                    b.Property<Guid?>("CreatorId")
                        .HasColumnType("char(36)")
                        .HasColumnName("CreatorId");

                    b.Property<string>("ExecutionPointerId")
                        .IsRequired()
                        .HasColumnType("varchar(255)");

                    b.Property<string>("Remark")
                        .IsRequired()
                        .HasMaxLength(500)
                        .HasColumnType("varchar(500)");

                    b.Property<int>("Status")
                        .HasColumnType("int");

                    b.Property<Guid?>("TenantId")
                        .HasColumnType("char(36)")
                        .HasColumnName("TenantId");

                    b.Property<string>("UserHeadPhoto")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.Property<Guid>("UserId")
                        .HasColumnType("char(36)");

                    b.Property<string>("UserIdentityName")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.Property<Guid>("WorkflowId")
                        .HasColumnType("char(36)");

                    b.HasKey("Id");

                    b.HasIndex("ExecutionPointerId");

                    b.HasIndex("WorkflowId");

                    b.ToTable("WorkflowAuditors");
                });

            modelBuilder.Entity("Abp.WorkflowCore.Persistence.PersistedExecutionPointer", b =>
                {
                    b.HasOne("Abp.WorkflowCore.Persistence.PersistedWorkflow", "Workflow")
                        .WithMany("ExecutionPointers")
                        .HasForeignKey("WorkflowId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Workflow");
                });

            modelBuilder.Entity("Abp.WorkflowCore.Persistence.PersistedExtensionAttribute", b =>
                {
                    b.HasOne("Abp.WorkflowCore.Persistence.PersistedExecutionPointer", "ExecutionPointer")
                        .WithMany("ExtensionAttributes")
                        .HasForeignKey("ExecutionPointerId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("ExecutionPointer");
                });

            modelBuilder.Entity("Abp.WorkflowCore.Persistence.PersistedWorkflow", b =>
                {
                    b.HasOne("Abp.Workflow.PersistedWorkflowDefinition", "WorkflowDefinition")
                        .WithMany()
                        .HasForeignKey("WorkflowDefinitionId", "Version")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("WorkflowDefinition");
                });

            modelBuilder.Entity("Panda.Workflow.Domain.Workflows.Entities.PersistedWorkflowAuditor", b =>
                {
                    b.HasOne("Abp.WorkflowCore.Persistence.PersistedExecutionPointer", "ExecutionPointer")
                        .WithMany()
                        .HasForeignKey("ExecutionPointerId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Abp.WorkflowCore.Persistence.PersistedWorkflow", "Workflow")
                        .WithMany()
                        .HasForeignKey("WorkflowId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("ExecutionPointer");

                    b.Navigation("Workflow");
                });

            modelBuilder.Entity("Abp.WorkflowCore.Persistence.PersistedExecutionPointer", b =>
                {
                    b.Navigation("ExtensionAttributes");
                });

            modelBuilder.Entity("Abp.WorkflowCore.Persistence.PersistedWorkflow", b =>
                {
                    b.Navigation("ExecutionPointers");
                });
#pragma warning restore 612, 618
        }
    }
}