namespace Panda.Domain.Entities;

public interface IHasSortExtension : IHasSort
{
    void SetSort(int sort);
}