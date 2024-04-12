FROM mcr.microsoft.com/dotnet/sdk:6.0-jammy AS build
WORKDIR /work
COPY net/ /work/
RUN set -eux \
    && dotnet build WebApplication_DIT_Docker.sln

FROM mcr.microsoft.com/dotnet/aspnet:6.0-jammy
LABEL version="1.0"
EXPOSE 80
WORKDIR /apps
COPY --from=build /work/WebApplication_DIT_Docker/bin/Debug/net6.0/* /apps/
RUN set -eux \
    && useradd -u 9000 appuser \
    && id appuser \
    && chown -R 9000:9000 /apps \
    && ls -la /apps
USER 9000:9000
ENTRYPOINT ["dotnet", "WebApplication_DIT_Docker.dll"]
