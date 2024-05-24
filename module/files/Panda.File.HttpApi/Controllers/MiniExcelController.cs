using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MiniExcelLibs;
using MiniExcelLibs.OpenXml;
using Volo.Abp.AspNetCore.Mvc;

namespace Panda.File.HttpApi.Controllers;

/*
 * 文档地址
 * https://toscode.mulanos.cn/dotnetchina/MiniExcel
 */

/// <summary>
/// MinExcel
/// </summary>
[Route("api/mini")]
public class MiniExcelController : AbpControllerBase
{
    /// <summary>
    /// 导出本地文件(模板)
    /// </summary>
    /// <returns>IActionResult</returns>
    [HttpGet("1")]
    public IActionResult ExcelDownload1()
    {
        var templatePath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "wwwroot", "template", "template.xlsx");
        var path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "wwwroot", "excel", "mini.xlsx");
        var value = new
        {
            Data = new[]
            {
                new { Name = "Jack", Price = "HR", Description = "中文122" },
                new { Name = "Lisa", Price = "HR", Description = "辅导费"  },
                new { Name = "John", Price = "HR", Description = "返回" },
                new { Name = "Mike", Price = "IT", Description = "得给对方" },
                new { Name = "Neo", Price = "IT", Description = "得给对方" },
                new { Name = "Loan", Price = "556265225852555214455", Description = "递归递归" }
            }
        };
        MiniExcel.SaveAsByTemplate(path, templatePath, value);
        return Content("OK");
    }

    /// <summary>
    /// 导出文件流(模板)
    /// </summary>
    /// <returns>2</returns>
    [HttpGet("2")]
    public IActionResult ExcelDownload2()
    {
        var templatePath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "wwwroot", "template", "template.xlsx");
        var value = new
        {
            Data = new[]
            {
                new { Name = "Jack", Price = "HR", Description = "中文122" },
                new { Name = "Lisa", Price = "HR", Description = "辅导费"  },
                new { Name = "John", Price = "HR", Description = "返回" },
                new { Name = "Mike", Price = "IT", Description = "得给对方" },
                new { Name = "Neo", Price = "IT", Description = "得给对方" },
                new { Name = "Loan", Price = "556265225852555214455", Description = "递归递归" }
            }
        };
        using var memoryStream = new MemoryStream();
        memoryStream.SaveAsByTemplate(templatePath, value);
        memoryStream.Seek(0, SeekOrigin.Begin);
        return new FileStreamResult(memoryStream, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
        {
            FileDownloadName = "demo.xlsx"
        };
    }

    /// <summary>
    /// 导出文件流(追加)
    /// </summary>
    /// <returns>3</returns>
    [HttpGet("3")]
    public IActionResult ExcelDownload3()
    {
        var path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "wwwroot", "excel", "mini.csv");

        // 原始数据
        {
            var value = new[] {
                new { ID=1,Name ="Jack",InDate=new DateTime(2021,01,03)},
                new { ID=2,Name ="Henry",InDate=new DateTime(2020,05,03)},
            };
            MiniExcel.SaveAs(path, value, overwriteFile: true);
        }

        // 最后一行新增一行数据
        {
            var value = new { ID = 3, Name = "Mike", InDate = new DateTime(2021, 04, 23) };
            MiniExcel.Insert(path, value);
        }

        // 最后一行新增N行数据
        {
            var value = new[] {
                new { ID=4,Name ="Frank",InDate=new DateTime(2021,06,07)},
                new { ID=5,Name ="Gloria",InDate=new DateTime(2022,05,03)},
            };
            MiniExcel.Insert(path, value);
        }

        return Content("OK");
    }


    /// <summary>
    /// 上传
    /// </summary>
    /// <param name="excel"></param>
    /// <returns></returns>
    [HttpPost("1")]
    public IActionResult UploadExcel(IFormFile excel)
    {
        var stream = new MemoryStream();
        excel.CopyTo(stream);
        var result = new List<dynamic>();
        foreach (var item in stream.Query(true))
        {
            // do your logic etc.
            result.Add(item);
        }

        return Ok("File uploaded successfully\ndata:" + System.Text.Json.JsonSerializer.Serialize(result));
    }

}