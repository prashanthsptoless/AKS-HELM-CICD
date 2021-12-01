FROM mcr.microsoft.com/dotnet/aspnet:3.1.21-alpine3.14

RUN apk update && apk upgrade --no-cache

WORKDIR /app
COPY ./out .

ENTRYPOINT ["dotnet", "parrot.dll"]