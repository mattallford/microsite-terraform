variable "storage_account_name" {
  type        = string
  description = "Name of the Azure Storage Account."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Azure Resource Group to deploy the storage account to. This is an existing resource, not provisioned by this Terraform configuration."
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID to deploy resources into."
}

variable "location" {
  type        = string
  default     = "westus"
  description = "Azure region in which resources will be deployed."
}
