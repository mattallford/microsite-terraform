terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.2"
    }
  }

  # Remote backend — Azure Blob Storage
  # All backend values live in backend.tfbackend, which uses #{...} Octopus
  # Deploy placeholders. Octopus substitutes real values before running:
  #   terraform init -backend-config=backend.tfbackend
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
  use_oidc = true
}

# Create Storage Account
resource "azurerm_storage_account" "static_site" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Static Website Hosting
# Enables the $web blob container and configures the default document and the
# custom 404 page served by Azure's static website endpoint.
resource "azurerm_storage_account_static_website" "static_site" {
  storage_account_id = azurerm_storage_account.static_site.id
  index_document     = "index.html"
  error_404_document = "404.html"
}
