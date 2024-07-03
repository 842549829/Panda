using System.ComponentModel.DataAnnotations;
using Volo.Abp.Application.Dtos;

namespace Panda.Net.Bases.Users.Dtos;

public class CreateInputDto : EntityDto
{
    [Required(ErrorMessage = "名称不能为空")]
    public string Name { get; set; }
}