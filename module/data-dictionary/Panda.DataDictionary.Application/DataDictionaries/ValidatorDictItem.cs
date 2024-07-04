using FluentValidation;
using Panda.Application.Validation;
using Panda.DataDictionary.Application.Contracts.DataDictionaries.DictCategories.Dtos;

namespace Panda.DataDictionary.Application.DataDictionaries;

public class ValidatorDictItem<T> : ValidationBase<T>
    where T : DictItemCreateOrUpdateDtoBase
{
    public ValidatorDictItem()
    {
        SetRules();
    }

    private void SetRules()
    {
        RuleFor(x => x.Name)
            .NotNull()
            .WithMessage("字典名称不能为空")
            .Length(2, 30)
            .WithMessage("字典名称输入错误 长度1-30位");

        RuleFor(x => x.Sort)
            .Must(ValidationSortNo)
            .WithMessage("排序号输入错误 必须是正数");

        RuleFor(x => x.Style)
            .Length(2, 30)
            .WithMessage("字典样式输入错误 长度1-30位");

        RuleFor(x => x.Describe)
            .NotNull()
            .WithMessage("字典描述不能为空")
            .Length(2, 30)
            .WithMessage("字典描述输入错误 长度1-150位");
    }
}