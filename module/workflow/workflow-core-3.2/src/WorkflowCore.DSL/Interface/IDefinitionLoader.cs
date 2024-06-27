using System;
using WorkflowCore.DSL.Models.v1;
using WorkflowCore.Models;

namespace WorkflowCore.DSL.Interface
{
    public interface IDefinitionLoader
    {
        WorkflowDefinition LoadDefinition(string source, Func<string, DefinitionSourceV1> deserializer);
    }
}