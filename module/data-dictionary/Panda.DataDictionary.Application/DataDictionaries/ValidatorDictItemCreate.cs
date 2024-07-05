using FluentValidation;
using Panda.DataDictionary.Application.Contracts.DataDictionaries.DictCategories.Dtos;

namespace Panda.DataDictionary.Application.DataDictionaries;

public class ValidatorDictItemCreate : ValidatorDictItem<DictItemCreateDto>
{
    public ValidatorDictItemCreate()
    {
        SetRules();
    }

    private void SetRules()
    {
        RuleFor(x => x.Key)
            .NotNull()
            .WithMessage("字典Key不能为空")
            .Length(1, 30)
            .WithMessage("字典Key输入错误 长度1-20位");

        RuleFor(x => x.Value)
            .NotNull()
            .WithMessage("字典值不能为空")
            .Length(1, 30)
            .WithMessage("字典值输入错误 长度1-20位");
    }
}