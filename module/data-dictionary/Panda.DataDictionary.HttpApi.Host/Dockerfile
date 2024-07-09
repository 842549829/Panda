#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER app
WORKDIR /app
EXPOSE 5000

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["module/data-dictionary/Panda.DataDictionary.HttpApi.Host/Panda.DataDictionary.HttpApi.Host.csproj", "module/data-dictionary/Panda.DataDictionary.HttpApi.Host/"]
COPY ["src/Panda.HttpApi.Host/Panda.HttpApi.Host.csproj", "src/Panda.HttpApi.Host/"]
COPY ["src/Panda.Application/Panda.Application.csproj", "src/Panda.Application/"]
COPY ["src/Panda.Application.Contracts/Panda.Application.Contracts.csproj", "src/Panda.Application.Contracts/"]
COPY ["src/Panda.Domain.Shared/Panda.Domain.Shared.csproj", "src/Panda.Domain.Shared/"]
COPY ["src/Panda.Domain/Panda.Domain.csproj", "src/Panda.Domain/"]
COPY ["src/Panda.EntityFrameworkCore/Panda.EntityFrameworkCore.csproj", "src/Panda.EntityFrameworkCore/"]
COPY ["src/Panda.HttpApi/Panda.HttpApi.csproj", "src/Panda.HttpApi/"]
COPY ["module/data-dictionary/Panda.DataDictionary.Application/Panda.DataDictionary.Application.csproj", "module/data-dictionary/Panda.DataDictionary.Application/"]
COPY ["module/net/Panda.Net.HttpApi.Client/Panda.Net.HttpApi.Client.csproj", "module/net/Panda.Net.HttpApi.Client/"]
COPY ["module/net/Panda.Net.Application.Contracts/Panda.Net.Application.Contracts.csproj", "module/net/Panda.Net.Application.Contracts/"]
COPY ["module/data-permission/Panda.DataPermission.Abstractions/Panda.DataPermission.Abstractions.csproj", "module/data-permission/Panda.DataPermission.Abstractions/"]
COPY ["module/messaging/Panda.Messaging.Application.Contracts/Panda.Messaging.Application.Contracts.csproj", "module/messaging/Panda.Messaging.Application.Contracts/"]
COPY ["module/messaging/Panda.Messaging.Domain.Shared/Panda.Messaging.Domain.Shared.csproj", "module/messaging/Panda.Messaging.Domain.Shared/"]
COPY ["module/net/Panda.Net.Domain.Shared/Panda.Net.Domain.Shared.csproj", "module/net/Panda.Net.Domain.Shared/"]
COPY ["module/data-dictionary/Panda.DataDictionary.Application.Contracts/Panda.DataDictionary.Application.Contracts.csproj", "module/data-dictionary/Panda.DataDictionary.Application.Contracts/"]
COPY ["module/data-dictionary/Panda.DataDictionary.Domain.Shared/Panda.DataDictionary.Domain.Shared.csproj", "module/data-dictionary/Panda.DataDictionary.Domain.Shared/"]
COPY ["module/data-dictionary/Panda.DataDictionary.Domain/Panda.DataDictionary.Domain.csproj", "module/data-dictionary/Panda.DataDictionary.Domain/"]
COPY ["module/data-permission/Panda.DataPermission/Panda.DataPermission.csproj", "module/data-permission/Panda.DataPermission/"]
COPY ["module/data-dictionary/Panda.DataDictionary.EntityFrameworkCore/Panda.DataDictionary.EntityFrameworkCore.csproj", "module/data-dictionary/Panda.DataDictionary.EntityFrameworkCore/"]
COPY ["module/data-permission/Panda.DataPermission.EntityFrameworkCore/Panda.DataPermission.EntityFrameworkCore.csproj", "module/data-permission/Panda.DataPermission.EntityFrameworkCore/"]
COPY ["module/data-dictionary/Panda.DataDictionary.HttpApi/Panda.DataDictionary.HttpApi.csproj", "module/data-dictionary/Panda.DataDictionary.HttpApi/"]
COPY ["module/data-permission/Panda.DataPermission.AspNetCore/Panda.DataPermission.AspNetCore.csproj", "module/data-permission/Panda.DataPermission.AspNetCore/"]
RUN dotnet restore "./module/data-dictionary/Panda.DataDictionary.HttpApi.Host/Panda.DataDictionary.HttpApi.Host.csproj"
COPY . .
WORKDIR "/src/module/data-dictionary/Panda.DataDictionary.HttpApi.Host"
RUN dotnet build "./Panda.DataDictionary.HttpApi.Host.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./Panda.DataDictionary.HttpApi.Host.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Panda.DataDictionary.HttpApi.Host.dll"]