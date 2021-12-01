default: all

CONFIG := terraform.auto.tfvars

ops_instance_id     := definite-marlin
env_instance_id     := fun-wolf
env_subscription_id := 77fc5cff-a120-47a1-83bc-5c64163f872d
state_prefix        := kubernetes-dev
ops_subscription_id := 17fe8838-4661-4395-bdab-4136639668d9

azurerm.backend.tfvars:
	az keyvault secret download \
		--name azurerm-backend-tfvars \
		--vault-name kv-$(ops_instance_id) \
		--file azurerm.backend.tfvars
	sed -i \
		's/container-pipelines.tfstate/$(state_prefix).terraform.tfstate/' \
		azurerm.backend.tfvars

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
	@echo 'resource_group_name="rg-$(env_instance_id)"'   > $(CONFIG)
	@echo 'env_subscription_id="$(env_subscription_id)"' >> $(CONFIG)
	@echo 'ops_subscription_id="$(ops_subscription_id)"' >> $(CONFIG)

plan: $(CONFIG) fmt validate
	terraform plan -out plan.tfplan
	
apply:
	terraform apply plan.tfplan
	rm plan.tfplan

all: init plan

login:
	az login
	az account set --subscription "Jim Counts (MSDN)"
	az account show