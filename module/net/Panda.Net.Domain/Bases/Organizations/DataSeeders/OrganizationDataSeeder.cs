using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Identity;
using Volo.Abp.MultiTenancy;
using Volo.Abp.Uow;

namespace Panda.Net.Bases.Organizations.DataSeeders;

public class OrganizationDataSeeder(
    IUnitOfWorkManager unitOfWorkManager,
    OrganizationUnitManager organizationUnitManager,
    ICurrentTenant currentTenant)
    : IOrganizationDataSeeder, ITransientDependency
{
    public async Task SeedAsync(Guid? tenantId = null)
    {
        using (currentTenant.Change(tenantId))
        {
            var or1 = new OrganizationUnit(Guid.NewGuid(), "成都市", null, tenantId);
            var or1A1 = new OrganizationUnit(Guid.NewGuid(), "锦江区", or1.Id, tenantId);
            var or1A1B1 = new OrganizationUnit(Guid.NewGuid(), "盐市口街道", or1A1.Id, tenantId);
            var or1A1B2 = new OrganizationUnit(Guid.NewGuid(), "太升路街道", or1A1.Id, tenantId);
            var or1A1B3 = new OrganizationUnit(Guid.NewGuid(), "督院街街道", or1A1.Id, tenantId);
            var or1A1B4 = new OrganizationUnit(Guid.NewGuid(), "春熙路街道", or1A1.Id, tenantId);
            var or1A2 = new OrganizationUnit(Guid.NewGuid(), "青羊区", or1.Id, tenantId);
            var or1A3 = new OrganizationUnit(Guid.NewGuid(), "金牛区", or1.Id, tenantId);
            var or1A4 = new OrganizationUnit(Guid.NewGuid(), "武侯区", or1.Id, tenantId);
            var or1A5 = new OrganizationUnit(Guid.NewGuid(), "成华区", or1.Id, tenantId);
            var or1A6 = new OrganizationUnit(Guid.NewGuid(), "高新区", or1.Id, tenantId);
            var or2 = new OrganizationUnit(Guid.NewGuid(), "宜宾市", null, tenantId);
            var or3 = new OrganizationUnit(Guid.NewGuid(), "自贡市", null, tenantId);
            var or4 = new OrganizationUnit(Guid.NewGuid(), "攀枝花市", null, tenantId);
            var or5 = new OrganizationUnit(Guid.NewGuid(), "泸州市", null, tenantId);
            var or6 = new OrganizationUnit(Guid.NewGuid(), "德阳市", null, tenantId);
            var or7 = new OrganizationUnit(Guid.NewGuid(), "绵阳市", null, tenantId);
            var or8 = new OrganizationUnit(Guid.NewGuid(), "广元市", null, tenantId);
            var or9 = new OrganizationUnit(Guid.NewGuid(), "遂宁市", null, tenantId);
            var or10 = new OrganizationUnit(Guid.NewGuid(), "内江市", null, tenantId);
            var or11 = new OrganizationUnit(Guid.NewGuid(), "乐山市", null, tenantId);
            var or11A1 = new OrganizationUnit(Guid.NewGuid(), "市中区", or11.Id, tenantId);
            var or11A1B1 = new OrganizationUnit(Guid.NewGuid(), "牟子镇", or11A1.Id, tenantId);
            var or11A1B2 = new OrganizationUnit(Guid.NewGuid(), "大佛街道", or11A1.Id, tenantId);
            var or11A1B3 = new OrganizationUnit(Guid.NewGuid(), "上河街街道", or11A1.Id, tenantId);
            var or11A2 = new OrganizationUnit(Guid.NewGuid(), "沙湾区", or11.Id, tenantId);
            var or11A3 = new OrganizationUnit(Guid.NewGuid(), "五通桥区", or11.Id, tenantId);
            var or12 = new OrganizationUnit(Guid.NewGuid(), "南充市", null, tenantId);
            var data = new List<OrganizationUnit>
            {
                or1,
                or1A1,
                or1A1B1,
                or1A1B2,
                or1A1B3,
                or1A1B4,
                or1A2,
                or1A3,
                or1A4,
                or1A5,
                or1A6,
                or2,
                or3,
                or4,
                or5,
                or6,
                or7,
                or8,
                or9,
                or10,
                or11,
                or11A1,
                or11A1B1,
                or11A1B2,
                or11A1B3,
                or11A2,
                or11A3,
                or12
            };
            foreach (var organizationUnit in data)
            {
                //using var unit =
                //    unitOfWorkManager.Begin(options: new AbpUnitOfWorkOptions(isTransactional: true), true);
                //await organizationUnitManager.CreateAsync(organizationUnit);
                //await unit.CompleteAsync();
            }
        }
    }
}