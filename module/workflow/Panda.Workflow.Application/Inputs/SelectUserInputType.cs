using Abp.Workflow;
using Volo.Abp.Validation.StringValues;

namespace Panda.Workflow.Application.Inputs;

[Serializable]
[InputType("SELECT_USERS")]
public class SelectUserInputType : InputTypeBase
{
    public SelectUserInputType()
    {

    }

    public SelectUserInputType(IValueValidator validator)
        : base(validator)
    {
    }
}