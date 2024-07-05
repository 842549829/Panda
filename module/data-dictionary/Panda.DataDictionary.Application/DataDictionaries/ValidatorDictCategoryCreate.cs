using FluentValidation;
using Panda.DataDictionary.Application.Contracts.DataDictionaries.DictCategories.Dtos;

namespace Panda.DataDictionary.Application.DataDictionaries;

public class ValidatorDictCategoryCreate : ValidatorDictCategory<DictCategoryCreateDto>
{
    public ValidatorDictCategoryCreate()
    {
        SetRules();
    }

    private void SetRules()
    {
        RuleFor(x => x.Key)
            .NotNull()
            .WithMessage("字典分类Key不能为空")
            .Length(1, 30)
            .WithMessage("字典分类Key输入错误 长度1-20位");
    }
}