default: all

CONFIG := terraform.auto.tfvars

env_instance_id     := fun-wolf
env_subscription_id := 77fc5cff-a120-47a1-83bc-5c64163f872d
ops_instance_id     := definite-marlin
ops_subscription_id := 17fe8838-4661-4395-bdab-4136639668d9

azurerm.backend.tfvars: 
	az keyvault secret download \
		--name azurerm-backend-tfvars \
		--vault-name kv-$(backend_instance_id) \
		--file azurerm.backend.tfvars

aad_script:
	az keyvault secret download \
		--name add-azuread-roles-sh \
		--vault-name kv-$(ops_instance_id) \
		--file add-azuread-roles.sh

fmt:
	terraform fmt -recursive

init: azurerm.backend.tfvars
	terraform init --upgrade -backend-config azurerm.backend.tfvars
	terraform -v
	terraform providers
	
clean: $(CONFIG)
	terraform destroy -auto-approve
	
validate:
	terraform validate

$(CONFIG):
	# TODO: this could also be loaded from keyvault
	@echo 'env_instance_id="$(env_instance_id)"'          > $(CONFIG)
	@echo 'env_subscription_id="$(env_subscription_id)"' >> $(CONFIG)
	@echo 'ops_instance_id="$(ops_instance_id)"'         >> $(CONFIG)
	@echo 'ops_subscription_id="$(ops_subscription_id)"' >> $(CONFIG)
	terraform fmt

plan: $(CONFIG) fmt validate
	terraform plan -out plan.tfplan
	
apply:
	terraform apply plan.tfplan
	rm plan.tfplan

all: init plan

login:
	bash ../../scripts/az-login.sh
