ARG IMAGE_BASE=mcr.microsoft.com/dotnet/core/aspnet:2.2.5-stretch-slim
FROM ${IMAGE_BASE}

ENV ASPNETCORE_URLS http://+:80

WORKDIR /app
RUN mkdir -p /data /ocdlls && \
    ln -s /data /app/App_Data

ADD ./build/release .

EXPOSE 80
ENTRYPOINT ["dotnet", "oc.dll"]