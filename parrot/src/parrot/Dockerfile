FROM microsoft/dotnet:2.2-aspnetcore-runtime-alpine

RUN apk update && apk upgrade --no-cache

WORKDIR /app
COPY ./dist .

ENTRYPOINT ["dotnet", "parrot.dll"]