using System;
using System.Collections.Generic;
using WorkflowCore.Models;

namespace WorkflowCore.DSL.Models.v1
{
    public class DefinitionSourceV1 : DefinitionSource
    {
        public string DataType { get; set; }

        public WorkflowErrorHandling DefaultErrorBehavior { get; set; }

        public TimeSpan? DefaultErrorRetryInterval { get; set; }

        public List<StepSourceV1> Steps { get; set; } = new List<StepSourceV1>();
    }
}
