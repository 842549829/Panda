using FluentValidation;
using Panda.Net.Bases.Users.Dtos;
using Panda.Net.Bases.Users.Managers;
using Panda.Net.Validation;

namespace Panda.Net.Bases.Users;

public class CreateInputDtoValidator : ValidationBase<CreateInputDto>
{
    private readonly IUserManager _manager;

    public CreateInputDtoValidator(IUserManager manager)
    {
        _manager = manager;
        SetRules();
    }

    private void SetRules()
    {
        RuleFor(x => x.Name)
            .NotNull()
            .WithMessage("名称 不能为空")
            .Length(2, 10)
            .WithMessage("名称 输入错误，长度2-10位");
    }
}