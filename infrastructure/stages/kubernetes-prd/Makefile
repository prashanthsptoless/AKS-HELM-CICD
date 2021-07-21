default: all

backend_instance_id := modest-horse
instance_id         := active-tetra
state_prefix        := kubernetes-prd

backend_config:
	az keyvault secret download \
		--name azurerm-backend-tfvars \
		--vault-name kv-$(backend_instance_id) \
		--file azurerm.backend.tfvars
	sed -i \
		's/container-pipelines.tfstate/$(state_prefix).container-pipelines.tfstate/' \
		azurerm.backend.tfvars

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
	@echo 'resource_group_name="rg-$(instance_id)"' > terraform.auto.tfvars

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