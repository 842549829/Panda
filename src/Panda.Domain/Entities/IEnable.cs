using Panda.Domain.Shared.Enums;

namespace Panda.Domain.Entities;

public interface IEnable
{
    Enable Status { get; }

    void ChangeStatus(Enable status);
}