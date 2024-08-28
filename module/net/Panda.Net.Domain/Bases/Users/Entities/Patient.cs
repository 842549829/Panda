using Panda.Domain.Entities;

namespace Panda.Net.Bases.Users.Entities;

public class Patient(Guid id, string name, string code, string idCardType, string idCardNo, string gender, string phone)
    : FullPersonnelAuditedAggregateRoot<Guid>(id, name, code, idCardType, idCardNo, gender, phone)
{
}