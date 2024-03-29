FROM mcr.microsoft.com/dotnet/sdk:6.0-jammy AS build
WORKDIR /work
COPY net/ /work/
RUN set -eux \
    && dotnet build WebApplication_DIT_Docker.sln

FROM mcr.microsoft.com/dotnet/aspnet:6.0-jammy
EXPOSE 80
WORKDIR /apps
COPY --from=build /work/WebApplication_DIT_Docker/bin/Debug/net6.0/* /apps/
RUN ls -la /apps
ENTRYPOINT ["dotnet", "WebApplication_DIT_Docker.dll"]
