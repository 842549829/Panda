using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Panda.Net.Migrations
{
    /// <inheritdoc />
    public partial class dataPermission : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "CustomDataPermission",
                table: "AbpRoles",
                type: "varchar(4096)",
                maxLength: 4096,
                nullable: false,
                defaultValue: "")
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AddColumn<int>(
                name: "DataPermission",
                table: "AbpRoles",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CustomDataPermission",
                table: "AbpRoles");

            migrationBuilder.DropColumn(
                name: "DataPermission",
                table: "AbpRoles");
        }
    }
}
