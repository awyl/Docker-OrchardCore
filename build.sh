#!/bin/sh

OC_VERSION=$(cat src/oc/oc.csproj | grep "</OrchardVersion>" | awk -F'OrchardVersion>|</' '{print $2}')

dotnet publish src/oc -c Release --output ./.root/app
docker build --rm -t awyl/oc:$OC_VERSION .
# docker buildx build --platform linux/amd64,linux/arm/v7 -o type=tar,dest=dockerimage.tar -t awyl/oc:$OC_VERSION .