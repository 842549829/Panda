﻿using Panda.DataDictionary.Domain.Shared.Enums;

namespace Panda.DataDictionary.Domain.DataDictionaries.Entities;

public class DictItem : DictEntity
{
    public DictItem(string key, string value, string name, Enable status, int sort, string describe, string style, string code, Guid? parnetId, Guid? tenantId) : base(key, name, status, sort, describe, code, parnetId, tenantId)
    {
        Style = style;
        Value = value;
    }

    public string Style { get; set; }

    public string Value { get; set; }
}