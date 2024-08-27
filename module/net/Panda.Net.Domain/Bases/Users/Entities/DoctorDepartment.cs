using Volo.Abp;
using Volo.Abp.Domain.Entities;
using Volo.Abp.MultiTenancy;

namespace Panda.Net.Bases.Users.Entities;

public class DoctorDepartment(Guid doctorId, Guid departmentId, Guid? tenantId) : Entity, IMultiTenant
{
    public Guid? TenantId { get; private set; } = tenantId;

    public Guid DoctorId { get; private set; } = doctorId;

    public Guid DepartmentId { get; private set; } = departmentId;

    /// <summary>
    /// 是否主要科室
    /// </summary>
    public bool IsPrimary { get; private set; }

    public void SetPrimary(bool isPrimary)
    {
        IsPrimary = isPrimary;
    }

    public  void CheckDoctorDepartment(IEnumerable<DoctorDepartment> doctorDepartments)
    {
        if (doctorDepartments.Count(a => a.IsPrimary) != 1)
        {
            throw new BusinessException(nameof(DoctorDepartment), "There must be only one primary department");
        }
    }

    public override object[] GetKeys()
    {
        return [DoctorId, DepartmentId];
    }
}