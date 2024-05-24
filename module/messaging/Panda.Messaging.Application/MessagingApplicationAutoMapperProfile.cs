using AutoMapper;
using JetBrains.Annotations;
using Panda.Messaging.Application.Contracts;
using Panda.Messaging.Domain.Entities;
using Panda.Messaging.Domain.Shared.Models;

namespace Panda.Messaging.Application;

public class MessagingApplicationAutoMapperProfile : Profile
{
    public MessagingApplicationAutoMapperProfile()
    {
        /* You can configure your AutoMapper mapping configuration here.
         * Alternatively, you can split your mapping configurations
         * into multiple profile classes for a better organization. */

        CreateMap<Message, MessageDto>()
            .ForMember(dest => dest.Tag,
                opt => opt.MapFrom((src, _) => ToBitStrings(src.Tag)));
        CreateMap<Message, MessageListDto>()
            .ForMember(dest => dest.Tag,
                opt => opt.MapFrom((src, _) => ToBitStrings(src.Tag)));
        CreateMap<Message, MessageReceivingDto>()
            .ForMember(dest => dest.IsRead, opt => opt.Ignore())
            .ForMember(dest => dest.ReadTime, opt => opt.Ignore())
            .ForMember(dest => dest.Tag,
                opt => opt.MapFrom((src, _) => ToBitStrings(src.Tag)));
        CreateMap<Message, MessageReceivingListDto>()
            .ForMember(dest => dest.IsRead, opt => opt.Ignore())
            .ForMember(dest => dest.ReadTime, opt => opt.Ignore())
            .ForMember(dest => dest.Tag,
                opt => opt.MapFrom((src, _) => ToBitStrings(src.Tag)));
        CreateMap<MessageUpdateDto, Message>()
            .ForMember(dest => dest.Tag,
                opt => opt.MapFrom(src => ToNullableBitLong(src.Tag)));
        CreateMap<MessageScope, MessageScopeDto>();
        CreateMap<MessageScopeDto, MessageScopeModel>();
    }

    /// <summary>
    /// Int 2 IntArray
    /// </summary>
    /// <param name="code">内容</param>
    /// <param name="length"></param>
    /// <returns></returns>
    private static int[] ToBitIntArray(long code, int length = 62)
    {
        var source = new List<int>();
        for (var index = length; index >= 0; --index)
        {
            var num = 1L << index;
            if ((code & num) == num)
            {
                source.Add((int)num);
            }
        }

        return source.OrderBy(m => m).ToArray();
    }

    /// <summary>
    /// NullableLong 2 StringArray
    /// </summary>
    /// <param name="code">内容</param>
    /// <param name="length"></param>
    /// <returns></returns>
    private static string[] ToBitStrings(long? code, int length = 62)
    {
        if (code == null)
        {
            return null;
        }

        var source = new List<string>();
        for (var index = length; index >= 0; --index)
        {
            var num = 1L << index;
            if ((code & num) == num)
            {
                source.Add(num.ToString());
            }
        }

        return source.OrderBy(m => m).ToArray();
    }

    /// <summary>
    /// StringArray 2 NullableLong
    /// </summary>
    /// <param name="codes"></param>
    /// <returns></returns>
    private static long? ToNullableBitLong([CanBeNull] string[] codes)
    {
        if (codes == null || !codes.Any())
        {
            return null;
        }

        long l = 0;
        foreach (var s in codes)
        {
            if (long.TryParse(s, out var result))
            {
                l += result;
            }
            else
            {
                return null;
            }
        }

        return l == 0 ? (long?)null : l;
    }
}