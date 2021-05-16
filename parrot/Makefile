BuildConfiguration := Release

default: all

all: test publish build scan

test: 
	dotnet test tests/parrot.UnitTests/parrot.UnitTests.csproj --configuration $(BuildConfiguration) --logger:trx

publish:
	dotnet publish src/parrot/parrot.csproj --configuration $(BuildConfiguration) --output ./src/parrot/dist/

build:
	docker build -f ./src/parrot/Dockerfile -t parrot:latest ./src/parrot

scan:
	trivy image --ignore-unfixed parrot:latest

clean:
	rm -rf ./src/parrot/dist