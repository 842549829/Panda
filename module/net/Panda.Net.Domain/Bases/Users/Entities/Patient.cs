using Panda.Domain.Entities;

namespace Panda.Net.Bases.Users.Entities;

public class Patient(string name, string code, string idCardType, string idCardNo, string gender, string phone)
    : FullPersonnelAuditedAggregateRoot<Guid>(name, code, idCardType, idCardNo, gender, phone)
{
}