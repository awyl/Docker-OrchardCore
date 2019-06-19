# Docker-OrchardCore (Experimentals)

This repo contains a simple project using nuget references.  It should be the same as `OrchardCore.Cms.Web` because most of the stuff are copied from there.

The differences between this image to the official docker image:
- Has extra code to load any additional dll on startup.  Especially those `IHostingStartup` assemblies.
- Has extra code to load additional modules.
- Has a arm32v7 build for Raspberry Pi.

## Tags

awyl/oc:x86-{OrchardCore Version}
awyl/oc:arm32v7-{OrchardCore Version}

They are on [Docker Hub](https://hub.docker.com/r/awyl/oc/tags).

## Usage

E.g., docker-compose.yml

```yml
services:
  oc:
    image: awyl/oc:x86-1.0.0-beta3-71674
    ports:
      - "80:80"
    environment:
      # The assembly name that ASPNET Core should look for IHostingStartup
      - ASPNETCORE_HOSTINGSTARTUPASSEMBLIES=YourAssemblyName
      # The dlls to load in order for ASPNET Core to find the assembly defined above.
      - ASPNETCORE_USESTARTUPDLLS=/ocdlls/YourIHostingStartupBootstrap.dll
    volumes:
      # /data is sym linked to AppData
      - YourHostAppDataFolder:/data
      # /ocdlls is the location to look for module dlls
      - YourModuleDllsFolder:/ocdlls
```

This is just an example.  You can mix and match the configuration.
