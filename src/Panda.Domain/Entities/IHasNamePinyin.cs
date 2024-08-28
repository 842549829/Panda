namespace Panda.Domain.Entities
{
    public interface IHasNamePinyin : IHasName
    {
        string Pinyin { get; }

        string PinyinFirstLetters { get; }
    }
}