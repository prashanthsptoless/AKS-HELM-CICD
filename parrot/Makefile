BuildConfiguration := Release

default: all

all: npmi test publish build scan

npmi: 
	rm -rf ./src/parrot/node_modules
	cd ./src/parrot && npm install

test: 
	dotnet test tests/parrot.UnitTests/parrot.UnitTests.csproj --configuration $(BuildConfiguration) --logger:trx

publish:
	dotnet publish src/parrot/parrot.csproj --configuration $(BuildConfiguration) --output ./src/parrot/out

build:
	docker build -f ./src/parrot/Dockerfile -t parrot:latest ./src/parrot

scan:
	trivy image --ignore-unfixed parrot:latest

clean:
	rm -rf ./src/parrot/out