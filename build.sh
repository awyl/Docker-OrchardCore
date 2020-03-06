#!/bin/sh

OC_VERSION=$(cat src/oc/oc.csproj | grep "</OrchardVersion>" | awk -F'OrchardVersion>|</' '{print $2}')

dotnet publish src/oc -c Release --output ./.root/app
docker build --rm -t awyl/oc:x86-$OC_VERSION .