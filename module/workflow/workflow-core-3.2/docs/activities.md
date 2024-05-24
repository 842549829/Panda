# Activities

An activity is defined as an item on an external queue of work, that a workflow can wait for.

In this example the workflow will wait for `activity-1`, before proceeding.  It also passes the value of `data.Value1` to the activity, it then maps the result of the activity to `data.Value2`.

Then we create a worker to process the queue of activity items.  It uses the `GetPendingActivity` method to get an activity and the data that a workflow is waiting for.


```C#
public class ActivityWorkflow : IWorkflow<MyData>
{
    public void Build(IWorkflowBuilder<MyData> builder)
    {
        builder                
            .StartWith<HelloWorld>()
            .Activity("activity-1", (data) => data.Value1)
                .Output(data => data.Value2, step => step.Result)
            .Then<PrintMessage>()
                .Input(step => step.Message, data => data.Value2);
    }
             
}
...

var activity = host.GetPendingActivity("activity-1", "worker1", TimeSpan.FromMinutes(1)).Result;

if (activity != null)
{
    Console.WriteLine(activity.Parameters);
    host.SubmitActivitySuccess(activity.Token, "Some response data");
}

```

The JSON representation of this step would look like this

```json
{
    "Id": "activity-step",
    "StepType": "WorkflowCore.Primitives.Activity, WorkflowCore",
    "Inputs": 
    {
        "ActivityName": "\"activity-1\"",
        "Parameters": "data.Value1" 
    },
    "Outputs": { "Value2": "step.Result" }
}
```

## JSON / YAML API

The `Activity` step can be configured using inputs as follows

| Field                  | Description                 |
| ---------------------- | --------------------------- |
| CancelCondition        | Optional expression to specify a cancel condition  |
| Inputs.ActivityName    | Expression to specify the activity name            |
| Inputs.Parameters      | Expression to specify the parameters to pass the activity worker                |
| Inputs.EffectiveDate   | Optional expression to specify the effective date  |


```json
{
    "Id": "MyActivityStep",
    "StepType": "WorkflowCore.Primitives.Activity, WorkflowCore",
    "NextStepId": "...",
    "CancelCondition": "...",
    "Inputs": {
        "ActivityName": "\"my-activity\"",
        "Parameters": "data.SomeValue"
    }
}
```
```yaml
Id: MyActivityStep
StepType: WorkflowCore.Primitives.Activity, WorkflowCore
NextStepId: "..."
CancelCondition: "..."
Inputs:
  ActivityName: '"my-activity"'
  EventKey: '"Key1"'
  Parameters: data.SomeValue

```

