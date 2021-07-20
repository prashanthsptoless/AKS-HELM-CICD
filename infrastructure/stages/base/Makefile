default: all

backend_storage_account_name := "saengagedemu"
backend_storage_container_name := "certs"

fmt:
	terraform fmt -recursive

init:
	terraform init --upgrade -backend-config azurerm.backend.tfvars
	terraform -v
	terraform providers
	
clean: config
	terraform destroy -auto-approve
	
validate:
	terraform validate

config:
	@echo 'resource_group_name="rg-united-monitor"' > terraform.auto.tfvars
	@echo 'backend_resource_group_name="rg-backend-golden-opossum"' >> terraform.auto.tfvars
	@echo 'configuration_keyvault_name="kv-golden-opossum"' >> terraform.auto.tfvars

plan: config fmt validate
	terraform plan -out plan.tfplan
	
apply:
	terraform apply plan.tfplan
	rm plan.tfplan

all: init plan

login:
	bash ../../scripts/az-login.sh

download:
	bash ../../scripts/download-certs.sh $(backend_storage_account_name) $(backend_storage_container_name) 