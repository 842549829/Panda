using Panda.Domain.Shared.Enums;

namespace Panda.Domain.Entities;

public interface IHasEnable
{
    Enable Status { get; }

    void ChangeStatus(Enable status);
}