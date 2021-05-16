FROM mcr.microsoft.com/dotnet/core/aspnet:3.1.5-alpine

RUN apk update && apk upgrade --no-cache

WORKDIR /app
COPY ./out .

ENTRYPOINT ["dotnet", "parrot.dll"]