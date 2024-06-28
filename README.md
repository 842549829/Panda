<br />

<h1 align="center">Panda</h1>

<br />

<h4 align="center">
    <p>
        <b>English</b> |
        <a href="./README_zh.md">中文</a>
    </p>
</h4>

<p align="center">ABP + EF Core Microservices open source framework</p>

<p align="center">⭐ Support workflow and message push ⭐</p>

<br />

<p align="center">💬 QQ group: 240647629</p>

<br />

<p align="center">
    <img src="https://img.shields.io/badge/language-csharp-orange?style=plastic"/>
    <img src="https://img.shields.io/github/stars/842549829/Panda?style=plastic"/>
    <img src="https://img.shields.io/github/forks/842549829/Panda?style=plastic"/>
    <img src="https://img.shields.io/github/license/842549829/Panda?style=plastic"/>
    <img src="https://img.shields.io/github/issues/842549829/Panda?style=plastic"/>
    <img src="https://img.shields.io/github/repo-size/842549829/Panda?style=plastic"/>
    <img src="https://img.shields.io/github/last-commit/842549829/Panda?style=plastic" />
</p>

<br />

## 🚀 Quick experience
> [Experience address](http://139.9.70.213)  
   Note: Because the server memory is very small, the workflow and message notification function services are not started at present. If there is a jam, the server is dead. Please contact the author from the server or you can contact the author donation server

<br />

## 🥇 Feature list (continuously updated)

- [x] User management
- [x] Role management
- [x] Menu management
- [x] Department management
- [x] Entry log
- [x] Operation log
- [x] System bulletin
- [x] File upload
- [x] Scheduled task
- [x] Message push
- [x] Workflow
- [x] File fragment upload
- [x] Data rights module

## Core technology

### Rear end C# Asp.Net Core

- [x] Dynamic API：ABP
- [x] ORM： EF Core
- [x] Authentication and authorization：OpenIddict
- [x] Workflow：workflow-core
- [x] Log：Serilog
- [x] Module：ABP
- [x] Dependency injection：Autofac
- [x] Object mapping：AutoMapper
- [x] Unitofwork：ABP
- [x] Multi tenant：ABP
- [x] Local cache：ABP
- [x] Distributed cache：Redis
- [x] Event bus：ABP
- [x] Microservice：ABP
- [x] Message notification：SignalR

### Front end Vue 3
> [!NOTE]
> [Front-end project open source address](https://gitee.com/notify/panda.net.web)


- [x] Component library：element-plus
- [x] Route：vue-router
- [x] Store：pinia
- [x] pack：vite	
- [x] Asynchronous request：axios
- [x] Chart：echarts
- [x] Workflow：jsplumb
- [x] Drag：vuedraggable
- [x] Custom form：vue + element-plus 

## Project structure

```bash
# Install abp cli 
dotnet tool install -g Volo.Abp.Cli
# Update abp cli
dotnet tool update -g Volo.Abp.Cli
# Create project	
abp new Panda.Net -u none --separate-auth-server -dbms mysql -d ef
```

### Panda.Net.AuthServer Authorization server

> [!TIP]
> Reference document:
> 
> OpenIddict
> 
> https://note.youdao.com/s/I7rsNw8N

Start command
```bash
dotnet Panda.Net.AuthServer.dll --urls https://localhost:44365
```
- [x] Resource owner password credentials
- [x] Authorization code
- [x] Client credentials
- [x] Device authorization code(Can be used for App scan code login)
- [x] Implicit( OAuth2.1 Deprecated no longer implemented) 
	- Added postman test json, placed in `src/Panda.Net.AuthServer/postman/postman_collection.json`
	- As shown in the figure
	- <img src="images/1.png" width="300px"/>
 
### Panda.Net.HttpApi.Host Service center

> [!TIP]
> Reference document:
> 
> Abp extends the User table
> 
> https://note.youdao.com/s/7oP7XG2O

Start command
```bash
dotnet Panda.Net.HttpApi.Host.dll --urls https://localhost:44368
```

### Panda.Workflow.HttpApi.Host Workflow

Start command
```cmd
dotnet Panda.Workflow.HttpApi.Host.dll --urls https://localhost:44598
```

screenshot： 
<table>
  <tr>
    <td><img src="module/workflow/images/1.png" /></td>
    <td><img src="module/workflow/images/2.png" /></td>
    <td><img src="module/workflow/images/3.png" /></td>
    <td><img src="module/workflow/images/4.png" /></td>
  </tr>
  <tr>
    <td><img src="module/workflow/images/5.png" /></td>
    <td><img src="module/workflow/images/6.png" /></td>
    <td><img src="module/workflow/images/7.png" /></td>
    <td><img src="module/workflow/images/8.png" /></td>
  </tr>
  <tr>
    <td><img src="module/workflow/images/9.png" /></td>
    <td><img src="module/workflow/images/10.png" /></td>
    <td><img src="module/workflow/images/11.png" /></td>
  </tr>
</table>
	
### Database restore

```bash
# install dotnet ef cli
dotnet tool install --global dotnet-ef
# update dotnet ef cli
dotnet tool update --global dotnet-ef
# migration
dotnet ef migrations add init -c NetDbContext
# database update
dotnet ef database update -c NetDbContext
# migration scripts (for building environments)
dotnet ef migrations script --verbose -i --project "Item absolute path" -c NetDbContext -o "Script absolute path"
# Generate a script for an iteration update, the difference script from this iteration 20240329102615_file1 to 20240408082719_announcement
dotnet ef migrations script --verbose -i --project "./" -c NetDbContext -o "./2.sql"  20240329102615_file1 20240408082719_announcement
```
## Script restore
```bash
#Script restore
New database panda
Execute script src/Panda.Net.EntityFrameworkCore/panda.sql 
```	

<br />

## 📢 Versions 

-  v1.0  Rights management + menu management + department management + login log + operation log + system announcement + file upload + Scheduled task + message push + Workflow + file fragment upload + approval flow module
-  v1.1  Add a data permission module
-  v2.0  vue3 + role + data permission
 - v2.1  Fix file upload memory leak