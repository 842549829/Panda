using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Panda.Messaging.EntityFrameworkCore.Migrations
{
    /// <inheritdoc />
    public partial class msg : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterDatabase()
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "AbpBackgroundJobs",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    JobName = table.Column<string>(type: "varchar(128)", maxLength: 128, nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    JobArgs = table.Column<string>(type: "longtext", maxLength: 1048576, nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    TryCount = table.Column<short>(type: "smallint", nullable: false, defaultValue: (short)0),
                    CreationTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    NextTryTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    LastTryTime = table.Column<DateTime>(type: "datetime(6)", nullable: true),
                    IsAbandoned = table.Column<bool>(type: "tinyint(1)", nullable: false, defaultValue: false),
                    Priority = table.Column<byte>(type: "tinyint unsigned", nullable: false, defaultValue: (byte)15),
                    ExtraProperties = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    ConcurrencyStamp = table.Column<string>(type: "varchar(40)", maxLength: 40, nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AbpBackgroundJobs", x => x.Id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "YaDeaMessages",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    ApplicationName = table.Column<string>(type: "varchar(36)", maxLength: 36, nullable: false, comment: "所属系统名称（消息发起系统）")
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    MessageType = table.Column<int>(type: "int", nullable: false, comment: "消息类型 1：通知，2：预警，99：其他 ..."),
                    PushProviderCode = table.Column<int>(type: "int", nullable: false, comment: "消息推送方式 1：系统消息，2：短信消息，4：邮件消息 ..."),
                    Title = table.Column<string>(type: "varchar(256)", maxLength: 256, nullable: false, comment: "消息标题")
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Content = table.Column<string>(type: "varchar(4010)", maxLength: 4010, nullable: false, comment: "消息内容")
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    DelayedSend = table.Column<bool>(type: "tinyint(1)", nullable: false, defaultValue: false, comment: "是否定时发送（延迟发送）0：否 1：是"),
                    SendTime = table.Column<DateTime>(type: "datetime(6)", nullable: false, comment: "发送时间"),
                    SendUserId = table.Column<Guid>(type: "char(36)", nullable: false, comment: "发送人Id", collation: "ascii_general_ci"),
                    SendUserName = table.Column<string>(type: "varchar(64)", maxLength: 64, nullable: false, comment: "发送人姓名")
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    ExpirationTime = table.Column<DateTime>(type: "datetime(6)", nullable: true, comment: "到期时间（到期后收件人不可查看）"),
                    RecalledUserId = table.Column<Guid>(type: "char(36)", nullable: true, comment: "撤回人Id", collation: "ascii_general_ci"),
                    RecalledUserName = table.Column<string>(type: "varchar(64)", maxLength: 64, nullable: true, comment: "撤回人Id")
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    RecalledTime = table.Column<DateTime>(type: "datetime(6)", nullable: true, comment: "撤回时间"),
                    Status = table.Column<int>(type: "int", nullable: false, defaultValue: 1, comment: "消息状态 1：已发布，2：已发送，3：已撤回"),
                    Tag = table.Column<long>(type: "bigint", nullable: true, comment: "标签 二进制编码，用于扩展"),
                    ExtraProperties = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    ConcurrencyStamp = table.Column<string>(type: "varchar(40)", maxLength: 40, nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    CreationTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    CreatorId = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    LastModificationTime = table.Column<DateTime>(type: "datetime(6)", nullable: true),
                    LastModifierId = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    IsDeleted = table.Column<bool>(type: "tinyint(1)", nullable: false, defaultValue: false),
                    DeleterId = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    DeletionTime = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_YaDeaMessages", x => x.Id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "YaDeaMessageScopes",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    MessageId = table.Column<Guid>(type: "char(36)", nullable: false, comment: "消息Id", collation: "ascii_general_ci"),
                    ProviderName = table.Column<string>(type: "varchar(64)", maxLength: 64, nullable: false, comment: "关联提供商类型（S：全局系统消息，A：系统，O：机构/部门，R：角色，G：群组，U：用户）")
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    ProviderKey = table.Column<string>(type: "varchar(64)", maxLength: 64, nullable: false, comment: "关联提供商类型名称（S：All，A：Number，O：Number，D：Number，R：RoleName，G：Number，U：UserName）")
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_YaDeaMessageScopes", x => x.Id);
                    table.ForeignKey(
                        name: "FK_YaDeaMessageScopes_YaDeaMessages_MessageId",
                        column: x => x.MessageId,
                        principalTable: "YaDeaMessages",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "YaDeaMessageNotifications",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    UserId = table.Column<Guid>(type: "char(36)", nullable: false, comment: "用户Id", collation: "ascii_general_ci"),
                    MessageId = table.Column<Guid>(type: "char(36)", nullable: false, comment: "消息Id", collation: "ascii_general_ci"),
                    MessageScopingId = table.Column<Guid>(type: "char(36)", nullable: false, comment: "消息范围Id", collation: "ascii_general_ci"),
                    IsRead = table.Column<bool>(type: "tinyint(1)", nullable: false, defaultValue: false, comment: "已读状态 0：未读，1：已读"),
                    ReadTime = table.Column<DateTime>(type: "datetime(6)", nullable: true, comment: "查阅时间")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_YaDeaMessageNotifications", x => x.Id);
                    table.ForeignKey(
                        name: "FK_YaDeaMessageNotifications_YaDeaMessageScopes_MessageScopingId",
                        column: x => x.MessageScopingId,
                        principalTable: "YaDeaMessageScopes",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_YaDeaMessageNotifications_YaDeaMessages_MessageId",
                        column: x => x.MessageId,
                        principalTable: "YaDeaMessages",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateIndex(
                name: "IX_AbpBackgroundJobs_IsAbandoned_NextTryTime",
                table: "AbpBackgroundJobs",
                columns: new[] { "IsAbandoned", "NextTryTime" });

            migrationBuilder.CreateIndex(
                name: "IX_YaDeaMessageNotifications_MessageId",
                table: "YaDeaMessageNotifications",
                column: "MessageId");

            migrationBuilder.CreateIndex(
                name: "IX_YaDeaMessageNotifications_MessageScopingId",
                table: "YaDeaMessageNotifications",
                column: "MessageScopingId");

            migrationBuilder.CreateIndex(
                name: "IX_YaDeaMessageNotifications_UserId_MessageScopingId_MessageId_~",
                table: "YaDeaMessageNotifications",
                columns: new[] { "UserId", "MessageScopingId", "MessageId", "IsRead" });

            migrationBuilder.CreateIndex(
                name: "IX_YaDeaMessages_ApplicationName_MessageType_Title",
                table: "YaDeaMessages",
                columns: new[] { "ApplicationName", "MessageType", "Title" });

            migrationBuilder.CreateIndex(
                name: "IX_YaDeaMessageScopes_MessageId_ProviderName_ProviderKey",
                table: "YaDeaMessageScopes",
                columns: new[] { "MessageId", "ProviderName", "ProviderKey" });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AbpBackgroundJobs");

            migrationBuilder.DropTable(
                name: "YaDeaMessageNotifications");

            migrationBuilder.DropTable(
                name: "YaDeaMessageScopes");

            migrationBuilder.DropTable(
                name: "YaDeaMessages");
        }
    }
}
