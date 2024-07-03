using Panda.DataDictionary.Domain.Shared.Localization;
using Volo.Abp.Application.Services;

namespace Panda.DataDictionary.Application;

public abstract class DataDictionaryAppService : ApplicationService
{
    protected DataDictionaryAppService()
    {
        LocalizationResource = typeof(DataDictionaryResource);
    }
}