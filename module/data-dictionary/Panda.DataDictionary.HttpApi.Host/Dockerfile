#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER app
WORKDIR /app
EXPOSE 5000

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /module/data-dictionary
COPY ["module/data-dictionary/Panda.DataDictionary.HttpApi.Host/Panda.DataDictionary.HttpApi.Host.csproj", "module/data-dictionary/Panda.DataDictionary.HttpApi.Host/"]
COPY ["module/data-dictionary/Panda.DataDictionary.Application/Panda.DataDictionary.Application.csproj", "module/data-dictionary/Panda.DataDictionary.Application/"]
COPY ["module/data-dictionary/Panda.DataDictionary.Domain/Panda.DataDictionary.Domain.csproj", "module/data-dictionary/Panda.DataDictionary.Domain/"]
COPY ["module/data-dictionary/Panda.DataDictionary.Domain.Shared/Panda.DataDictionary.Domain.Shared.csproj", "module/data-dictionary/Panda.DataDictionary.Domain.Shared/"]
COPY ["module/data-dictionary/Panda.DataDictionary.Application.Contracts/Panda.DataDictionary.Application.Contracts.csproj", "module/data-dictionary/Panda.DataDictionary.Application.Contracts/"]
COPY ["module/data-dictionary/Panda.DataDictionary.EntityFrameworkCore/Panda.DataDictionary.EntityFrameworkCore.csproj", "module/data-dictionary/Panda.DataDictionary.EntityFrameworkCore/"]
COPY ["module/data-dictionary/Panda.DataDictionary.HttpApi/Panda.DataDictionary.HttpApi.csproj", "module/data-dictionary/Panda.DataDictionary.HttpApi/"]
RUN dotnet restore "./module/data-dictionary/Panda.DataDictionary.HttpApi.Host/Panda.DataDictionary.HttpApi.Host.csproj"
COPY . .
WORKDIR "/module/data-dictionary/module/data-dictionary/Panda.DataDictionary.HttpApi.Host"
RUN dotnet build "./Panda.DataDictionary.HttpApi.Host.csproj" -f net8.0 -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./Panda.DataDictionary.HttpApi.Host.csproj" -f net8.0 -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Panda.DataDictionary.HttpApi.Host.dll"]