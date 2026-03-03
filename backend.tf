terraform {
    # Remote backend — Azure Blob Storage
    # All backend values live in backend.tfbackend, which uses #{...} Octopus
    # Deploy placeholders. Octopus substitutes real values before running:
    # terraform init -backend-config=backend.tfbackend
  backend "azurerm" {
    use_oidc = true
    use_azuread_auth     = true
    resource_group_name = "#{TerraformBackend.ResourceGroupName}"
    storage_account_name = "#{TerraformBackend.StorageAccountName}"
    container_name       = "#{TerraformBackend.ContainerName}"
    key                  = "#{TerraformBackend.StateKey}"
  }  
}