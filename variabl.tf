variable "instances" {
  description = "List of instances to create"
}
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}
variable "location" {
  description = "Location for the resource group"
  type        = string
}