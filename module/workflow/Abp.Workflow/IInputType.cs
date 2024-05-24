using Volo.Abp.Validation.StringValues;

namespace Abp.Workflow;

public interface IInputType
{
    string Name { get; }

    object this[string key] { get; set; }

    IDictionary<string, object> Attributes { get; }

    IValueValidator Validator { get; set; }
}