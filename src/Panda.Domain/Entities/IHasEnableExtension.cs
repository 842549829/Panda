﻿using Panda.Domain.Shared.Enums;

namespace Panda.Domain.Entities;

public interface IHasEnableExtension : IHasEnable
{
    void SetStatus(Enable status);
}