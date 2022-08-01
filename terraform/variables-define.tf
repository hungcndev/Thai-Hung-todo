variable "prefix" {
  description = "Prefix name for every resource"
  type        = string
}

variable "resource_group_name" {
  description = "Name of Resource Group"
  type        = string
}

variable "resource_location" {
  description = "Location for every resource"
  type        = string
}

variable "tags" {
  description = "Tags for every resource"
  type        = map(any)
}
