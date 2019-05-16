FROM mcr.microsoft.com/dotnet/core/aspnet:2.1-stretch-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:2.1-stretch AS build
WORKDIR /src
COPY ["SimpleFeedReader/SimpleFeedReader.csproj", "SimpleFeedReader/"]
RUN dotnet restore "SimpleFeedReader/SimpleFeedReader.csproj"
COPY . .
WORKDIR "/src/SimpleFeedReader"
RUN dotnet build "SimpleFeedReader.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "SimpleFeedReader.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "SimpleFeedReader.dll"]