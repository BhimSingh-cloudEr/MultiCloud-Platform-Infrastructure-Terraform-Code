variable "vnet_name" {
  description = "value of vnet_name"
  default     = "myVnet"
}
variable "location" {
  description = "value of location"
  default     = "East US"
}
variable "resource_group_name" {
  description = "value of resource_group_name"
  default     = "myResourceGroup"
}
variable "resource_group_location" {
  description = "value of resource_group_location"
  default     = "East US"
}
variable "vnet_address_space" {
  description = "value of vnet_address_space"
  default     = ["10.0.0.0/16"]
}
variable "azurerm_count" {
  description = "Number of Azure instances to create"
  type        = number
  default     = 1
}