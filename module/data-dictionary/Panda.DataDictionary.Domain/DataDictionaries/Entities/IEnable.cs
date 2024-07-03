using Panda.DataDictionary.Domain.Shared.Enums;

namespace Panda.DataDictionary.Domain.DataDictionaries.Entities;

public interface IEnable
{
    Enable Status { get; }

    void ChangeStatus(Enable status);
}