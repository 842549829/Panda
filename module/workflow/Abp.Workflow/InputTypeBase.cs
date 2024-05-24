using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp.Validation.StringValues;

namespace Abp.Workflow;

public abstract class InputTypeBase(IValueValidator validator) : IInputType
{

    protected InputTypeBase()
        : this(new AlwaysValidValueValidator())
    {
    }

    public virtual string Name
    {
        get
        {
            var typeInfo = GetType().GetTypeInfo();
            return typeInfo.IsDefined(typeof(InputTypeAttribute)) ? typeInfo.GetCustomAttributes(typeof(InputTypeAttribute)).Cast<InputTypeAttribute>().First().Name : typeInfo.Name;
        }
    }

    public object this[string key]
    {
        get => Attributes.GetOrDefault(key)!;
        set => Attributes[key] = value;
    }

    public IDictionary<string, object> Attributes { get; } = new Dictionary<string, object>();

    public IValueValidator Validator { get; set; } = validator;

    public static string GetName<TInputType>() where TInputType : IInputType
    {
        if (Activator.CreateInstance(typeof(TInputType)) is IInputType d)
        {
            return d.Name;
        }

        return string.Empty;
    }
}