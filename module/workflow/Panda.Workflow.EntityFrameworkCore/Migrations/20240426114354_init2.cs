using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Panda.Workflow.EntityFrameworkCore.Migrations
{
    /// <inheritdoc />
    public partial class init2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_WorkflowAuditors_WorkflowExecutionPointers_ExecutionPointerId",
                table: "WorkflowAuditors");

            migrationBuilder.AlterColumn<string>(
                name: "UserIdentityName",
                table: "WorkflowAuditors",
                type: "longtext",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "longtext")
                .Annotation("MySql:CharSet", "utf8mb4")
                .OldAnnotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AlterColumn<string>(
                name: "UserHeadPhoto",
                table: "WorkflowAuditors",
                type: "longtext",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "longtext")
                .Annotation("MySql:CharSet", "utf8mb4")
                .OldAnnotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AlterColumn<string>(
                name: "Remark",
                table: "WorkflowAuditors",
                type: "varchar(500)",
                maxLength: 500,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "varchar(500)",
                oldMaxLength: 500)
                .Annotation("MySql:CharSet", "utf8mb4")
                .OldAnnotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AlterColumn<string>(
                name: "ExecutionPointerId",
                table: "WorkflowAuditors",
                type: "varchar(255)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "varchar(255)")
                .Annotation("MySql:CharSet", "utf8mb4")
                .OldAnnotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AddForeignKey(
                name: "FK_WorkflowAuditors_WorkflowExecutionPointers_ExecutionPointerId",
                table: "WorkflowAuditors",
                column: "ExecutionPointerId",
                principalTable: "WorkflowExecutionPointers",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_WorkflowAuditors_WorkflowExecutionPointers_ExecutionPointerId",
                table: "WorkflowAuditors");

            migrationBuilder.UpdateData(
                table: "WorkflowAuditors",
                keyColumn: "UserIdentityName",
                keyValue: null,
                column: "UserIdentityName",
                value: "");

            migrationBuilder.AlterColumn<string>(
                name: "UserIdentityName",
                table: "WorkflowAuditors",
                type: "longtext",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "longtext",
                oldNullable: true)
                .Annotation("MySql:CharSet", "utf8mb4")
                .OldAnnotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.UpdateData(
                table: "WorkflowAuditors",
                keyColumn: "UserHeadPhoto",
                keyValue: null,
                column: "UserHeadPhoto",
                value: "");

            migrationBuilder.AlterColumn<string>(
                name: "UserHeadPhoto",
                table: "WorkflowAuditors",
                type: "longtext",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "longtext",
                oldNullable: true)
                .Annotation("MySql:CharSet", "utf8mb4")
                .OldAnnotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.UpdateData(
                table: "WorkflowAuditors",
                keyColumn: "Remark",
                keyValue: null,
                column: "Remark",
                value: "");

            migrationBuilder.AlterColumn<string>(
                name: "Remark",
                table: "WorkflowAuditors",
                type: "varchar(500)",
                maxLength: 500,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "varchar(500)",
                oldMaxLength: 500,
                oldNullable: true)
                .Annotation("MySql:CharSet", "utf8mb4")
                .OldAnnotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.UpdateData(
                table: "WorkflowAuditors",
                keyColumn: "ExecutionPointerId",
                keyValue: null,
                column: "ExecutionPointerId",
                value: "");

            migrationBuilder.AlterColumn<string>(
                name: "ExecutionPointerId",
                table: "WorkflowAuditors",
                type: "varchar(255)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "varchar(255)",
                oldNullable: true)
                .Annotation("MySql:CharSet", "utf8mb4")
                .OldAnnotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AddForeignKey(
                name: "FK_WorkflowAuditors_WorkflowExecutionPointers_ExecutionPointerId",
                table: "WorkflowAuditors",
                column: "ExecutionPointerId",
                principalTable: "WorkflowExecutionPointers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
