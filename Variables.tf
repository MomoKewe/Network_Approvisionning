variable "resource_group_name" {
  default       = "RG-Mouhamadou-BA"
  description   = "Le nom du groupe de ressource dans Azure."
}

variable "resource_group_location" {
  default = "West Europe"
  description   = "La localisation du groupe de ressource."
}

variable "vnet_name" {
  default = "myVnet"
  description   = "Le nom du réseau virtuel."
}
variable "prefix" {
  default = "tfvmex"
}
