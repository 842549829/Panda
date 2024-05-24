using System;
using System.Data;
using Dapper;

namespace Panda.Net.EntityFrameworkCore;

public class JsonTypeHandler: SqlMapper.ITypeHandler
{
    public void SetValue(IDbDataParameter parameter, object value)
    {
        parameter.Value = System.Text.Json.JsonSerializer.Serialize(value);
    }

    public object Parse(Type destinationType, object value)
    {
        return System.Text.Json.JsonSerializer.Deserialize(value as string, destinationType);
    }
}