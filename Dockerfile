ARG IMAGE_BASE=mcr.microsoft.com/dotnet/core/aspnet:2.2.5-stretch-slim
FROM ${IMAGE_BASE}

ENV ASPNETCORE_URLS http://+:80

RUN mkdir -p /data /ocdlls /app && \
    cd /app && \
    ln -s /data App_Data

WORKDIR /app
COPY .build/release /app

EXPOSE 80
ENTRYPOINT ["dotnet", "oc.dll"]