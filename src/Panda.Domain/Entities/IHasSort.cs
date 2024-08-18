
namespace Panda.Domain.Entities;

public interface IHasSort
{
    int Sort { get; }

    void ChangeSort(int sort);
}