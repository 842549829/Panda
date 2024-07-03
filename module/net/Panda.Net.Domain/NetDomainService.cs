using Microsoft.Extensions.Localization;
using System;
using Panda.Net.Localization;
using Volo.Abp;
using Volo.Abp.Domain.Services;
using Volo.Abp.Localization;

namespace Panda.Net;

public abstract class NetDomainService : DomainService
{
    private IStringLocalizer? _localizer;

    private Type? _localizationResource = typeof(NetResource);

    protected IStringLocalizerFactory StringLocalizerFactory => LazyServiceProvider.LazyGetRequiredService<IStringLocalizerFactory>();

    protected IStringLocalizer L => _localizer ??= CreateLocalizer();

    protected Type? LocalizationResource
    {
        get => _localizationResource;
        set
        {
            _localizationResource = value;
            _localizer = null;
        }
    }

    protected virtual IStringLocalizer CreateLocalizer()
    {
        if (LocalizationResource != null)
        {
            return StringLocalizerFactory.Create(LocalizationResource);
        }

        var localizer = StringLocalizerFactory.CreateDefaultOrNull();
        if (localizer == null)
        {
            throw new AbpException($"Set {nameof(LocalizationResource)} or define the default localization resource type (by configuring the {nameof(AbpLocalizationOptions)}.{nameof(AbpLocalizationOptions.DefaultResourceType)}) to be able to use the {nameof(L)} object!");
        }

        return localizer;
    }
}