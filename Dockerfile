ARG IMAGE_BASE=mcr.microsoft.com/dotnet/aspnet:7.0.5-bullseye-slim
FROM ${IMAGE_BASE}

COPY .root /

ENV ASPNETCORE_URLS=http://+:80 \
    DOTNET_ADDITIONAL_DEPS=/ocdlls

RUN mkdir -p /data /ocdlls /app && \
    cd /app && \
    ln -s /data App_Data

WORKDIR /app

EXPOSE 80
ENTRYPOINT ["dotnet", "oc.dll"]
