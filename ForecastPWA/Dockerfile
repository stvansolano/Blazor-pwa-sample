FROM mcr.microsoft.com/dotnet/core/aspnet:3.0-buster-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:3.0-buster AS build
WORKDIR /src
COPY ["ForecastPWA.csproj", "ForecastPWA/"]

WORKDIR "ForecastPWA"

RUN dotnet restore "ForecastPWA.csproj"
COPY . .
RUN dotnet build "ForecastPWA.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "ForecastPWA.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "ForecastPWA.dll"]

EXPOSE 443