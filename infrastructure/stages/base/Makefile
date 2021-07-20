default: all

backend_instance_id := modest-horse
instance_id         := active-tetra

backend_config:
	az keyvault secret download \
		--name azurerm-backend-tfvars \
		--vault-name kv-$(backend_instance_id) \
		--file azurerm.backend.tfvars

aad_script:
	az keyvault secret download \
		--name add-azureadroles-ps1 \
		--vault-name kv-$(backend_instance_id) \
		--file Add-AzureAdRoles.ps1

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
	@echo 'backend_resource_group_name="rg-backend-$(backend_instance_id)"' >> terraform.auto.tfvars
	@echo 'configuration_keyvault_name="kv-$(backend_instance_id)"' >> terraform.auto.tfvars

plan: config fmt validate
	terraform plan -out plan.tfplan
	
apply:
	terraform apply plan.tfplan
	rm plan.tfplan

all: init plan

login:
	bash ../../scripts/az-login.sh
