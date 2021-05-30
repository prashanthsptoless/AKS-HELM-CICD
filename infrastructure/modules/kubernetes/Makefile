default: validate

init:
	terraform init -backend=false
	terraform providers

fmt:
	terraform fmt

validate: init fmt
	terraform validate