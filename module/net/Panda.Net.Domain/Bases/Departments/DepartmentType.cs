using Panda.Domain.Entities;

namespace Panda.Net.Bases.Departments;

/// <summary>
/// 科室类型
/// </summary>
public class DepartmentType(string name) : FullAuditedAggregateHealthcare<Guid>(name);