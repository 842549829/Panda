namespace Panda.Domain.Entities;

public interface IHasSortExtension : IHasSort
{
    void ChangeSort(int sort);
}