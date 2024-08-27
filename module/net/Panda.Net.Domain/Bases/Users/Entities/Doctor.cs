using Panda.Domain.Entities;

namespace Panda.Net.Bases.Users.Entities;

public class Doctor(string accountNo, string name, string code, string idCardType, string idCardNo, string gender, string phone)
    : FullPersonnelAuditedAggregateRoot<Guid>(name, code, idCardType, idCardNo, gender, phone)
{
    public string AccountNo { get; set; } = accountNo;

    /// <summary>
    /// 学历
    /// </summary>
    public string? Education { get; private set; }

    /// <summary>
    /// 毕业学校
    /// </summary>
    public string? MedicalSchool { get; private set; }

    /// <summary>
    /// 专业
    /// </summary>
    public string? Major { get; private set; }

    /// <summary>
    /// 毕业时间
    /// </summary>
    public DateTime? GraduationDate { get; private set; }

    public void SetEducationalBackground(string? education, string? medicalSchool, string? major, DateTime? graduationDate)
    {
        Education = education;
        MedicalSchool = medicalSchool;
        Major = major;
        GraduationDate = graduationDate;
    }

    /// <summary>
    /// 医生头像
    /// </summary>
    public string? Avatar { get; private set; }

    /// <summary>
    /// 执业证书编号
    /// </summary>
    public string? PracticeLicenseNumber { get; private set;}

    /// <summary>
    /// 执业范围
    /// </summary>
    public string? PracticeScope { get; private set; }

    /// <summary>
    /// 执业有效期
    /// </summary>
    public DateTime? PracticeValidityDate { get; private set; }

    /// <summary>
    /// 执业经验
    /// </summary>
    public string? PracticeExperience { get; private set; }

    /// <summary>
    /// 工作年限
    /// </summary>
    public string? WorkAgeLimit { get; private set; }

    /// <summary>
    /// 专业领域
    /// </summary>
    public string? Specialization { get; private set; }

    /// <summary>
    /// 研究成果
    /// </summary>
    public string? ResearchResult { get; private set; }

    public void SetPracticeInfo(string? practiceLicenseNumber,
        string? practiceScope,
        DateTime? practiceValidityDate,
        string? practiceExperience, 
        string? workAgeLimit, 
        string? specialization, 
        string? researchResult)
    {
        PracticeLicenseNumber = practiceLicenseNumber;
        PracticeScope = practiceScope;
        PracticeValidityDate = practiceValidityDate;
        PracticeExperience = practiceExperience;
        WorkAgeLimit = workAgeLimit;
        Specialization = specialization;
        ResearchResult = researchResult;
    }

    /// <summary>
    /// 类型(按医疗专业分类)
    /// 内科医生
    /// 外科医生
    /// 儿科医生
    /// 妇产科医生
    /// 精神病医生
    /// 男科医生
    /// 老年病医生
    /// 急诊科医生
    /// 病理科医生
    /// 职业病医生
    /// 心脏病专家
    /// 肿瘤医生
    /// 眼科医生
    /// 全科医生
    /// 康复医学医生
    /// 放射科医生
    /// 影像科医生
    /// 口腔科医生
    /// </summary>
    public string? ProfessionalClassify { get; private set; }

    /// <summary>
    /// 类型(按医生的类型和评价)
    /// 偶像型医生：常在媒体上露面，通过形象建立吸引患者。
    /// 默默经营型医生：通过长期的医疗实践和患者的引介来吸引患者。
    /// 江湖型医生：善于察言观色，能言善道，为达到目的可以不择手段。
    /// </summary>
    public string? EvaluateClassify { get; private set; }

    /// <summary>
    /// 类型(按工作内容和职责分类)
    /// 医师：负责诊断、治疗疾病、预防疾病和保健。
    /// 护士：负责给病人提供护理和护理服务，同时还要负责病人的药物管理，协助医生做化验检查等。
    /// 技术人员：指研究、技术分析、调研、实验、设备维护等技术型的医疗人员。
    /// </summary>
    public string? WorkClassify { get; private set; }

    /// <summary>
    /// 类型(按执业类别分类)
    /// 临床医生
    /// 中医医生
    /// 口腔医生
    /// 预防医学医生
    /// </summary>
    public string? PracticeClassify { get; private set; }

    /// <summary>
    /// 类型(按特质类型分类)
    /// 权威型医生：年长且不重视新信息。
    /// 教授型医生：学术性强，偏好深入讨论。
    /// 投资家型医生：关注市场与经济信息。
    /// 实干家型医生：忙碌，注重实际帮助。
    /// </summary>
    public string? PeculiarityClassify { get; private set; }

    /// <summary>
    /// 类型(按执业范围分类)
    /// 重症医学医生
    /// 内科医生
    /// 外科医生
    /// 妇科医生
    /// 儿科医生
    /// 肿瘤科医生
    /// 超声医学医生
    /// 放射科医生
    /// 影像科医生
    /// </summary>
    public string? ScopeClassify { get; private set; }

    /// <summary>
    /// 类型(按职业发展阶段分类)
    /// 住院医师
    /// 主治医师
    /// 副主任医师
    /// 主任医师
    /// 教授/副教授
    /// </summary>
    public string? OccupationClassify { get; private set; }

    public void SetClassify(string? professionalClassify,
        string? evaluateClassify,
        string? workClassify,
        string? practiceClassify,
        string? peculiarityClassify,
        string? scopeClassify,
        string? occupationClassify)
    {
        ProfessionalClassify = professionalClassify;
        EvaluateClassify = evaluateClassify;
        WorkClassify = workClassify;
        PracticeClassify = practiceClassify;
        PeculiarityClassify = peculiarityClassify;
        ScopeClassify = scopeClassify;
        SetOccupationClassify(occupationClassify);
    }

    public void SetAvatar(string? avatar)
    {
        Avatar = avatar;
    }

    public void SetOccupationClassify(string? occupationClassify)
    {
        OccupationClassify = occupationClassify;
    }
}