using Microsoft.AspNetCore.Mvc;
using OfficeOpenXml;
using Volo.Abp.AspNetCore.Mvc;

namespace Panda.File.HttpApi.Controllers;

[Route("api/files/excel")]
public class ExcelController : AbpController
{
    [HttpGet]
    public IActionResult ExcelDownload(int index = 10, int size = 10)
    {
        var files = ExportToExcelAsStream(index, size);
        MergeExcelFiles1(files, Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "wwwroot", "excel", "x.xlsx"));
        return Content("OK");
    }

    private string[] ExportToExcelAsStream(int pageIndex, int pageSize)
    {
        var result = new List<string>();
        for (int i = 0; i < 10; i++)
        {
            var data = GetPagedDataForExport(i, pageSize);
            var path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "wwwroot", "excel");
            if (!System.IO.File.Exists(path))
            {
                _ = Directory.CreateDirectory(path);
            }
            var filePath = Path.Combine(path, $"{Guid.NewGuid()}+{i}.xlsx");
            using (var package = new ExcelPackage(new FileInfo(filePath)))
            {
                // 获取或创建第一个工作表
                var worksheet = package.Workbook.Worksheets.Add("Sheet1");

                // 写入Excel
                var row = 0;
                foreach (var item in data)
                {
                    row++;
                    worksheet.Cells[row, 1].Value = item.Name;
                    worksheet.Cells[row, 2].Value = item.Description;
                }

                // 自动调整列宽
                worksheet.Cells.AutoFitColumns();

                // 保存到本地
                package.Save();
            }
            result.Add(filePath);
        }

        return result.ToArray();




        //using (var package = new ExcelPackage())
        //{
        //    var worksheet = package.Workbook.Worksheets.Add("Sheet1");

        //    // 查询并分页获取数据
        //    var data = GetPagedDataForExport(pageIndex, pageSize);

        //    // 写入Excel
        //    var row = 0;
        //    foreach (var item in data)
        //    {
        //        row++;
        //        worksheet.Cells[row, 1].Value = item.Name;
        //        worksheet.Cells[row, 2].Value = item.Description;
        //        // ...
        //    }

        //    // 设置响应头以支持流式下载
        //    Response.Headers.TryAdd("Content-Disposition", "attachment; filename=data.xlsx");
        //    Response.Headers.TryAdd("Content-Type", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        //    // 返回Excel文件流
        //    return File(package.GetAsByteArray(), "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        //}
    }

    private static List<Stu> GetPagedDataForExport(int idx, int pageSize)
    {
        var result = new List<Stu>();
        for (var i = 0; i < pageSize; i++)
        {
            result.Add(new Stu { Name = idx + "张" + i, Description = "描述" + i });

        }
        return result;
    }

    public void MergeExcelFiles(string[] inputFilePaths, string outputFilePath)
    {
        // 创建一个新的Excel Package作为输出文件
        using (var package = new ExcelPackage(new FileInfo(outputFilePath)))
        {
            // 遍历每个输入文件
            foreach (var inputFile in inputFilePaths)
            {
                // 打开输入的Excel文件
                using (var inputPackage = new ExcelPackage(new FileInfo(inputFile)))
                {
                    // 遍历输入文件中的每一个工作表
                    foreach (var worksheet in inputPackage.Workbook.Worksheets)
                    {
                        // 在新工作簿中复制工作表（可选：更改工作表名称以避免重复）
                        var newWorksheet = package.Workbook.Worksheets.Add(worksheet.Name + "_" + Guid.NewGuid().ToString()[..4]);

                        // 复制数据
                        for (var row = 1; row <= worksheet.Dimension.End.Row; row++)
                        {
                            for (var col = 1; col <= worksheet.Dimension.End.Column; col++)
                            {
                                newWorksheet.Cells[row, col].Value = worksheet.Cells[row, col].Value;
                                // 可以在这里复制样式、公式等，例如：
                                // newWorksheet.Cells[row, col].Style = worksheet.Cells[row, col].Style.Clone();
                                //newWorksheet.Cells[row, col].Style.Border = worksheet.Cells[row, col].Style.Border;
                                //newWorksheet.Cells[row, col].Style.Fill = worksheet.Cells[row, col].Style.Fill;
                                //newWorksheet.Cells[row, col].Style.Font = worksheet.Cells[row, col].Style.Font;
                                //// 检查并复制公式
                                //if (worksheet.Cells[row, col].Formula != null)
                                //{
                                //    newWorksheet.Cells[row, col].Formula = worksheet.Cells[row, col].Formula;
                                //}
                            }
                        }
                    }
                }
            }

            // 保存合并后的工作簿
            package.Save();
        }
    }


    public void MergeExcelFiles1(string[] inputFilePaths, string outputFilePath)
    {
        // 创建一个新的Excel文件作为输出
        using (var package = new ExcelPackage(new FileInfo(outputFilePath)))
        {
            // 添加一个新的工作表
            var worksheet = package.Workbook.Worksheets.Add("合并数据");

            // 遍历文件夹中的所有Excel文件
            var files = inputFilePaths;
            foreach (var file in files)
            {
                // 使用EPPlus打开每个Excel文件
                using (var sourcePackage = new ExcelPackage(new FileInfo(file)))
                {
                    // 获取第一个工作表
                    var sourceWorksheet = sourcePackage.Workbook.Worksheets.FirstOrDefault();
                    if (sourceWorksheet != null)
                    {
                        var i = worksheet.Dimension?.End?.Row ?? 0;
                        // 读取数据并追加到输出工作表中
                        int startRow = i + 1; // 确定新数据的起始行
                        for (int row = 1; row <= sourceWorksheet.Dimension.End.Row; row++)
                        {
                            for (int col = 1; col <= sourceWorksheet.Dimension.End.Column; col++)
                            {
                                // 复制单元格数据
                                worksheet.Cells[startRow + row - 1, col].Value = sourceWorksheet.Cells[row, col].Value;
                            }
                        }
                    }
                }
            }

            // 保存合并后的Excel文件
            package.Save();
        }
    }
}

public class Stu
{
    public string Name { get; set; } = default!;

    public string Description { get; set; } = default!;
}