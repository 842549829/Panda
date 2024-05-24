using System.Text.Json;
using Abp.Workflow;
using Microsoft.EntityFrameworkCore;

namespace Abp.WorkflowCore.Persistence.EntityFrameworkCore;

public static class ModelBuilderExtension
{
    public static ModelBuilder ConfigWorkflowCore(this ModelBuilder modelBuilder)
    {
        var builder = modelBuilder.Entity<PersistedWorkflowDefinition>();
        builder.Property(u => u.Version).HasDefaultValue(1);
        builder.HasKey(u => new { u.Id, u.Version });
        builder.Property(u => u.Title).HasMaxLength(256);
        builder.Property(u => u.Group).HasMaxLength(100);
        builder.Property(u => u.Icon).HasMaxLength(50);
        builder.Property(u => u.Color).HasMaxLength(50);
        builder.Property(u => u.Id).HasMaxLength(100);

        builder.Property(u => u.Inputs).HasConversion(u => u.ToJsonString(false, false), u => u.FromJsonString<IEnumerable<IEnumerable<IEnumerable<WorkflowFormData>>>>());
        builder.Property(u => u.Nodes).HasConversion(u => u.ToJsonString(false, false), u => u.FromJsonString<IEnumerable<WorkflowNode>>());

        modelBuilder.Entity<PersistedWorkflow>().HasOne(u => u.WorkflowDefinition).WithMany().HasForeignKey(u => new { u.WorkflowDefinitionId, u.Version });
        return modelBuilder;
    }
}

public static class JsonExtensions
{
    public static JsonSerializerOptions CreateJsonSerializerOptions(
        bool camelCase = true,
        bool indented = false)
    {
        var serializerOptions = new JsonSerializerOptions(new JsonSerializerOptions(JsonSerializerDefaults.Web)
        {
            ReadCommentHandling = JsonCommentHandling.Skip,
            AllowTrailingCommas = true
        });
        if (camelCase)
        {
            serializerOptions.PropertyNamingPolicy = JsonNamingPolicy.CamelCase;
        }
        if (indented)
        {
            serializerOptions.WriteIndented = true;
        }
        return serializerOptions;
    }

    //
    // 摘要:
    //     Converts given object to JSON string.
    public static string ToJsonString(this object obj, bool camelCase = false, bool indented = false)
    {
        var jsonSerializerSettings = CreateJsonSerializerOptions(camelCase, indented);

        return obj.ToJsonString(jsonSerializerSettings);
    }

    //
    // 摘要:
    //     Converts given object to JSON string using custom Newtonsoft.Json.JsonSerializerSettings.
    public static string ToJsonString(this object obj, JsonSerializerOptions settings)
    {
        if (obj == null)
        {
            return null;
        }

        return JsonSerializer.Serialize(obj, settings);
    }

    //
    // 摘要:
    //     Returns deserialized string using default Newtonsoft.Json.JsonSerializerSettings
    //
    //
    // 参数:
    //   value:
    //
    // 类型参数:
    //   T:
    public static T FromJsonString<T>(this string value)
    {
        return value.FromJsonString<T>(CreateJsonSerializerOptions(false, false));
    }

    //
    // 摘要:
    //     Returns deserialized string using custom Newtonsoft.Json.JsonSerializerSettings
    //
    //
    // 参数:
    //   value:
    //
    //   settings:
    //
    // 类型参数:
    //   T:
    public static T FromJsonString<T>(this string value, JsonSerializerOptions settings)
    {
        if (value == null)
        {
            return default(T);
        }

        return JsonSerializer.Deserialize<T>(value, settings);
    }

    //
    // 摘要:
    //     Returns deserialized string using explicit System.Type and custom Newtonsoft.Json.JsonSerializerSettings
    //
    //
    // 参数:
    //   value:
    //
    //   type:
    //
    //   settings:
    public static object FromJsonString(this string value, Type type, JsonSerializerOptions settings)
    {
        if (type == null)
        {
            throw new ArgumentNullException("type");
        }

        if (value == null)
        {
            return null;
        }

        return JsonSerializer.Deserialize(value, type, settings);
    }
}