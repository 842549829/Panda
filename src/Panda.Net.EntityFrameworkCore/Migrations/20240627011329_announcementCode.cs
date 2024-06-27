using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Panda.Net.Migrations
{
    /// <inheritdoc />
    public partial class announcementCode : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Code",
                table: "AbpAnnouncements",
                type: "varchar(4096)",
                maxLength: 4096,
                nullable: false,
                defaultValue: "")
                .Annotation("MySql:CharSet", "utf8mb4");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Code",
                table: "AbpAnnouncements");
        }
    }
}
