namespace Abp.Workflow;

[AttributeUsage(AttributeTargets.Class)]
public class InputTypeAttribute(string name) : Attribute
{
    public string Name { get; set; } = name;
}