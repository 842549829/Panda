using FluentValidation;
using Panda.DataDictionary.Application.Contracts.DataDictionaries.DictCategories.Dtos;

namespace Panda.DataDictionary.Application.DataDictionaries;

public class ValidatorDictCategoryUpdate : ValidatorDictCategory<DictCategoryUpdateDto>
{
    public ValidatorDictCategoryUpdate()
    {
        SetRules();
    }

    private void SetRules()
    {
        RuleFor(x => x.ConcurrencyStamp)
            .Length(32)
            .WithMessage("字典分类迸发标记输入错误 长度32位");
    }
}