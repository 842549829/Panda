using Panda.Domain.Entities;

namespace Panda.Net.Bases.Departments;

public class Department(string name) : FullAuditedAggregateHealthcare<Guid>(name)
{
    public string? ShortName { get; set; }

    /// <summary>
    /// 科室类型
    /// </summary>
    public Guid DepartmentTypeId { get; set; }

    /// <summary>
    /// 所在院区
    /// </summary>
    public string HospitalZone { get; set; }

    /// <summary>
    /// 所在大楼
    /// </summary>
    public string? Building { get; set; }

    /// <summary>
    /// 所在楼层
    /// </summary>
    public string Floor { get; set; }

    /// <summary>
    /// 房间号
    /// </summary>
    public string RoomNumber { get; set; }

    /// <summary>
    /// 床位数/接待能力(该科室可容纳的最大病人数或接诊量)
    /// </summary>
    public int Capacity { get; set; }

    /// <summary>
    /// 联系电话
    /// </summary>
    public string Phone { get; set; }

    /// <summary>
    /// 电子邮箱
    /// </summary>
    public string Email { get; set; }


    
    //HeadOfDepartment(科室负责人)
    //类型：VARCHAR(100)
    //非空：否
    //    描述：科室的主要负责人姓名。
    //HeadOfDepartmentPhone(负责人电话)
    //类型：VARCHAR(20)
    //非空：否
    //    描述：科室主要负责人的联系电话。
    //HeadOfDepartmentEmail(负责人邮箱)
    //类型：VARCHAR(100)
    //非空：否
    //    描述：科室主要负责人的电子邮件地址。
    //Website(科室网站)
    //类型：VARCHAR(255)
    //非空：否
    //    描述：科室的官方网站链接。
    //ServicesOffered(提供的服务)
    //类型：TEXT
    //    非空：否
    //    描述：科室提供的主要医疗服务列表。
    //OpeningHours(开放时间)
    //类型：TEXT
    //    非空：否
    //    描述：科室的工作时间和特殊时间安排。
    //EmergencyContact(紧急联系人)
    //类型：VARCHAR(100)
    //非空：否
    //    描述：紧急情况下可以联系的人的名字。
    //EmergencyPhone(紧急联系电话)
    //类型：VARCHAR(20)
    //非空：否
    //    描述：紧急情况下可以拨打的电话号码。
    //Description(描述)
    //类型：TEXT
    //    非空：否
    //    描述：关于科室的简要介绍或备注信息。
    //CreatedOn(创建日期)
    //类型：DATETIME
    //    非空：是
    //    描述：记录科室信息创建的时间。
    //CreatedBy(创建人)
    //类型：VARCHAR(100)
    //非空：否
    //    描述：创建科室信息的用户姓名。
    //UpdatedOn(更新日期)
    //类型：DATETIME
    //    非空：否
    //    描述：记录科室信息最后一次被修改的时间。
    //UpdatedBy(更新人)
    //类型：VARCHAR(100)
    //非空：否
    //    描述：最后修改科室信息的用户姓名。
    //IsActive(是否有效)
    //类型：BOOLEAN
    //    默认值：TRUE
    //    描述：标记科室是否还在使用状态。
}