using Microsoft.AspNetCore.Authorization;
using Panda.DataDictionary.Domain.Shared.Localization;
using Volo.Abp.AspNetCore.Mvc;

namespace Panda.DataDictionary.HttpApi.Controllers;

[Authorize]
public abstract class DictionaryBaseController : AbpControllerBase
{
    protected DictionaryBaseController()
    {
        LocalizationResource = typeof(DataDictionaryResource);
    }
}