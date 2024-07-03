using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Panda.Net.Bases.Permissions;
using Panda.Net.Bases.Permissions.Dtos;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Panda.Net.Controllers.Bases;

[Route("api/basics/permissions")]
[ApiController]
public class PermissionController : NetController
{
    private readonly IPermissionAppService _permissionAppService;

    public PermissionController(IPermissionAppService permissionAppService)
    {
        _permissionAppService = permissionAppService;
    }

    [HttpGet("all")]
    [Authorize]
    public Task<List<PermissionTreeDto>> GetAllPermissionsAsync()
    {
        return _permissionAppService.GetAllPermissionsAsync();
    }

    [HttpGet("curr")]
    [Authorize]
    public Task<List<PermissionTreeDto>> GetCurrentPermissionsAsync()
    {
        return _permissionAppService.GetCurrentPermissionsAsync();
    }
    
    [HttpGet("group")]
    public  Task<List<PermissionGroupDefinitionDto>> GetPermissionGroupDefinitionListAsync()
    {
        return _permissionAppService.GetPermissionGroupDefinitionListAsync();
    }
    
    [HttpGet("definition/{groupName}")]
    public  Task<List<PermissionDefinitionDto>> GetPermissionDefinitionListAsync(string groupName)
    {
        return _permissionAppService.GetPermissionDefinitionListAsync(groupName);
    }
}