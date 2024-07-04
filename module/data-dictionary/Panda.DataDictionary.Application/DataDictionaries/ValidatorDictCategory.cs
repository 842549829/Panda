using FluentValidation;
using Panda.Application.Validation;
using Panda.DataDictionary.Application.Contracts.DataDictionaries.DictCategories.Dtos;

namespace Panda.DataDictionary.Application.DataDictionaries;

public class ValidatorDictCategory<T> : ValidationBase<T>
    where T : DictCategoryCreateOrUpdateDtoBase
{
    public ValidatorDictCategory()
    {
        SetRules();
    }

    private void SetRules()
    {
        RuleFor(x => x.Name)
            .NotNull()
            .WithMessage("字典分类名称不能为空")
            .Length(2, 30)
            .WithMessage("字典分类名称输入错误 长度1-30位");

        RuleFor(x => x.Sort)
            .Must(ValidationSortNo)
            .WithMessage("排序号输入错误 必须是正数");

        RuleFor(x => x.Alias)
            .NotNull()
            .WithMessage("字典分类别名不能为空")
            .Length(2, 30)
            .WithMessage("字典分类别名输入错误 长度1-30位");

        RuleFor(x => x.Describe)
            .NotNull()
            .WithMessage("字典分类描述不能为空")
            .Length(2, 30)
            .WithMessage("字典分类描述输入错误 长度1-150位");
    }
}