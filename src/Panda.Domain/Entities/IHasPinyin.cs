namespace Panda.Domain.Entities
{
    public interface IHasPinyin
    {
        string Pinyin { get; }

        string PinyinFirstLetters { get; }
    }
}