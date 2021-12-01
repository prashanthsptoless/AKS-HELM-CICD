FROM mcr.microsoft.com/dotnet/aspnet:3.1-alpine

RUN apk update && apk upgrade --no-cache

WORKDIR /app
COPY ./out .

ENTRYPOINT ["dotnet", "parrot.dll"]