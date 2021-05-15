FROM mcr.microsoft.com/dotnet/core/aspnet:3.1.5-alpine

RUN apk update && apk upgrade --no-cache

WORKDIR /app
COPY ./dist .

ENTRYPOINT ["dotnet", "parrot.dll"]