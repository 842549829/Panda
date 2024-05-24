using Abp.Workflow;
using Volo.Abp.Validation.StringValues;

namespace Panda.Workflow.Application.Inputs;

[Serializable]
[InputType("SELECT_ROLES")]
public class SelectRoleInputType : InputTypeBase
{
    public SelectRoleInputType()
    {
    }

    public SelectRoleInputType(IValueValidator validator)
        : base(validator)
    {
    }
}