ARG IMAGE_BASE=mcr.microsoft.com/dotnet/core/aspnet:2.2.5-stretch-slim
FROM {IMAGE_BASE}

ENV ASPNETCORE_URLS http://+:80

RUN mkdir -p /data /ocdlls && \
    ln -s /data /app/App_Data

WORKDIR /app
ADD ./build/release .

EXPOSE 80
ENTRYPOINT ["dotnet", "oc.dll"]