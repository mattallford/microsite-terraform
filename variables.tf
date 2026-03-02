variable "storage_account_name" {
  type        = string
  description = "Name of the Azure Storage Account. Injected by Octopus Deploy at deploy time — do not set a default."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Azure Resource Group that contains (or will contain) the storage account. Injected by Octopus Deploy at deploy time — do not set a default."
}

variable "location" {
  type        = string
  default     = "westus"
  description = "Azure region in which resources will be deployed."
}
