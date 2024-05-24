using Panda.Net.Bases.Organizations.Dtos;
using Panda.Net.Bases.Organizations.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Identity;
using Volo.Abp.ObjectExtending;

namespace Panda.Net.Bases.Organizations;

public class OrganizationAppService(
    IOrganizationRepository organizationRepository,
    OrganizationUnitManager organizationUnitManager,
    IOrganizationDapperRepository organizationDapperRepository)
    : NetAppService, IOrganizationAppService
{
    [RemoteService(IsEnabled = false)]
    public async Task<OrganizationDto> CreateAsync(OrganizationCreateDto input)
    {
        var organizationUnit = new OrganizationUnit(GuidGenerator.Create(), input.DisplayName, input.ParentId,
            CurrentUser.TenantId);
        input.MapExtraPropertiesTo(organizationUnit);
        await organizationUnitManager.CreateAsync(organizationUnit);
        await CurrentUnitOfWork?.SaveChangesAsync()!;
        return ObjectMapper.Map<OrganizationUnit, OrganizationDto>(organizationUnit);
    }

    [RemoteService(IsEnabled = false)]
    public async Task<OrganizationDto> UpdateAsync(Guid id, OrganizationUpdateDto input)
    {
        var organizationUnit = await organizationRepository.GetAsync(id);
        organizationUnit.DisplayName = input.DisplayName;
        organizationUnit.ConcurrencyStamp = input.ConcurrencyStamp;
        input.MapExtraPropertiesTo(organizationUnit);
        await organizationUnitManager.UpdateAsync(organizationUnit);
        return ObjectMapper.Map<OrganizationUnit, OrganizationDto>(organizationUnit);
    }

    [RemoteService(IsEnabled = false)]
    public async Task<OrganizationDto> GetAsync(Guid id)
    {
        return ObjectMapper.Map<OrganizationUnit, OrganizationDto>(
            await organizationRepository.GetAsync(id)
        );
    }

    [RemoteService(IsEnabled = false)]
    public async Task<PagedResultDto<OrganizationTreeDto>> GetListAsync(GetOrganizationsInput input)
    {
        var count = await organizationDapperRepository.GetCountAsync(input.Filter, input.ParentId);
        var list = await organizationDapperRepository.GetListAsync(input.Sorting,
            input.Filter,
            input.ParentId,
            input.MaxResultCount,
            input.SkipCount);

        var data = new PagedResultDto<OrganizationTreeDto>(
            count,
            ObjectMapper.Map<List<OrganizationUnit>, List<OrganizationTreeDto>>(list)
        );

        if (list.Count == 0)
        {
            return data;
        }

        var childList =
            await organizationDapperRepository.GetOrganizationUnitsWithChildCountAsync(list.Select(ca => ca.Id)
                .ToList());
        foreach (var item in data.Items)
        {
            foreach (var child in childList.Where(child => child.Id == item.Id))
            {
                item.HasChildren = child.Count > 0;
            }
        }

        return data;
    }

    [RemoteService(IsEnabled = false)]
    public async Task<List<OrganizationDto>> GetSelectAsync(Guid? parentId, bool recursive = false)
    {
        var list = await organizationUnitManager.FindChildrenAsync(parentId, recursive);
        return ObjectMapper.Map<List<OrganizationUnit>, List<OrganizationDto>>(list);
    }

    [RemoteService(IsEnabled = false)]
    public async Task<List<OrganizationTreeDto>> GetTreeAsync(Guid? parentId)
    {
        var list = await organizationUnitManager.FindChildrenAsync(parentId, false);
        var dtoList = ObjectMapper.Map<List<OrganizationUnit>, List<OrganizationTreeDto>>(list);
        var childList =
            await organizationDapperRepository.GetOrganizationUnitsWithChildCountAsync(list.Select(ca => ca.Id)
                .ToList());
        foreach (var item in dtoList)
        {
            foreach (var child in childList.Where(child => child.Id == item.Id))
            {
                item.HasChildren = child.Count > 0;
            }
        }

        var tree = ConvertSelectOrganization(dtoList, parentId);
        return tree;
    }

    public async Task DeleteAsync(Guid id)
    {
        await organizationUnitManager.DeleteAsync(id);
    }

    private static List<OrganizationTreeDto> ConvertSelectOrganization(List<OrganizationTreeDto> list, Guid? parentId)
    {
        var arrays = new List<OrganizationTreeDto>();
        var dataList = list.Where(a => a.ParentId == parentId)
            .OrderBy(a => a.Code);
        foreach (var item in dataList)
        {
            var children = ConvertSelectOrganization(list, item.Id);
            if (children.Count > 0)
            {
                item.Children = children;
                item.HasChildren = true;
            }

            arrays.Add(item);
        }

        return arrays;
    }
}