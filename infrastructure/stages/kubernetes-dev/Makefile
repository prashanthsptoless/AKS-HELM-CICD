default: all

fmt:
	terraform fmt -recursive

init:
	#terraform init --upgrade 
	terraform init --upgrade -backend-config azurerm.backend.tfvars
	terraform -v
	terraform providers
	
clean: config
	terraform destroy -auto-approve
	
validate:
	terraform validate

config:
	@echo 'resource_group_name="rg-boss-crawdad"' > terraform.auto.tfvars
	@echo 'aks_cluster_name="aks-boss-crawdad-dev"' >> terraform.auto.tfvars
	@echo 'aks_vnet_name="vnet-aks-boss-crawdad-dev"' >> terraform.auto.tfvars
	@echo 'backend_resource_group_name="rg-backend-engaged-emu"' >> terraform.auto.tfvars
	@echo 'configuration_keyvault_name="kv-engaged-emu"' >> terraform.auto.tfvars

plan: config fmt validate
	terraform plan -out plan.tfplan
	
apply:
	terraform apply plan.tfplan
	rm plan.tfplan

all: init plan

login:
	az login
	az account set --subscription "Jim Counts (MSDN)"
	az account show