default: validate

init:
	terraform init -backend=false

fmt:
	terraform fmt

validate: init fmt
	terraform validate