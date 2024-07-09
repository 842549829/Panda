#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER app
WORKDIR /app
EXPOSE 5000

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["Panda.DataDictionary.HttpApi.Host/Panda.DataDictionary.HttpApi.Host.csproj", "src/Panda.DataDictionary.HttpApi.Host/"]
COPY ["Panda.DataDictionary.Application/Panda.DataDictionary.Application.csproj", "src/Panda.DataDictionary.Application/"]
COPY ["Panda.DataDictionary.Domain/Panda.DataDictionary.Domain.csproj", "src/Panda.DataDictionary.Domain/"]
COPY ["Panda.DataDictionary.Domain.Shared/Panda.DataDictionary.Domain.Shared.csproj", "src/Panda.DataDictionary.Domain.Shared/"]
COPY ["Panda.DataDictionary.Application.Contracts/Panda.DataDictionary.Application.Contracts.csproj", "src/Panda.DataDictionary.Application.Contracts/"]
COPY ["Panda.DataDictionary.EntityFrameworkCore/Panda.DataDictionary.EntityFrameworkCore.csproj", "src/Panda.DataDictionary.EntityFrameworkCore/"]
COPY ["Panda.DataDictionary.HttpApi/Panda.DataDictionary.HttpApi.csproj", "src/Panda.DataDictionary.HttpApi/"]
RUN dotnet restore "./src/Panda.DataDictionary.HttpApi.Host/Panda.DataDictionary.HttpApi.Host.csproj"
COPY . .
WORKDIR "/src/src/Panda.DataDictionary.HttpApi.Host"
RUN dotnet build "./Panda.DataDictionary.HttpApi.Host.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./Panda.DataDictionary.HttpApi.Host.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Panda.DataDictionary.HttpApi.Host.dll"]