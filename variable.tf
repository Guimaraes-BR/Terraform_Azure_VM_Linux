variable "location" {
  default     = "East US"
  type        = string
  description = "Define a região de execução"
}

variable "resource_group" {
  default     = "rg-terraform"
  type        = string
  description = "Define o grupo de recursos"
}

#vnet and subnets
variable "vnet_name" {
  default     = "vnet-terraform"
  type        = string
  description = "Define o nome da vnet"
}

variable "vnet_address_space" {
  default     = "10.0.0.0/16"
  type        = string
  description = "Define o address_space"
}

variable "subnet_name" {
  default     = "sub_terraform"
  type        = string
  description = "Define o nome da subnet"
}

variable "subnet_address_prefixes" {
  default     = "10.0.2.0/24"
  type        = string
  description = "Define o subnet_address_prefixes"
}

variable "name_nic_terraform" {
  default     = "nic_terraform"
  type        = string
  description = "Define o nic name"
}

#Virtual Machine Linux
variable "vm_lnx_name" {
  default     = "terraform-lnx"
  type        = string
  description = "Define o nome da vm linux"
}

variable "vm_lnx_size" {
  default     = "Standard_B2s"
  type        = string
  description = "Define o size da vm linux"
}

variable "vm_lnx_admin_username" {
  default     = "adminuser"
  type        = string
  description = "Define o user name da vm linux"
}

variable "vm_lnx_os_disk_caching" {
  default     = "ReadWrite"
  type        = string
  description = "Define o os_disk_caching da vm linux"
}

variable "vm_lnx_storage_account_type" {
  default     = "Standard_LRS"
  type        = string
  description = "Define o storage_account_type da vm linux"
}

variable "vm_lnx_source_image_reference_publisher" {
  default     = "Canonical"
  type        = string
  description = "Define o source_image_reference_publisher da vm linux"
}

variable "vm_lnx_source_image_reference_offer" {
  default     = "0001-com-ubuntu-server-jammy"
  type        = string
  description = "Define o source_image_reference_offer da vm linux"
}

variable "vm_lnx_source_image_reference_sku" {
  default     = "22_04-lts"
  type        = string
  description = "Define o source_image_reference_sku da vm linux"
}

variable "vm_lnx_source_image_reference_version" {
  default     = "latest"
  type        = string
  description = "Define o source_image_reference_version da vm linux"
}

variable "vm_lnx_pip_name" {
  default     = "pip_terraform"
  type        = string
  description = "Define o nome do IP público  da vm linux"
}

variable "vm_lnx_pip_allocation_method" {
  default     = "Static"
  type        = string
  description = "Define o metodo do IP público da vm linux"
}


variable "nic_ip_configuration_name" {
  default     = "internal"
  type        = string
  description = "Define o nic_ip_configuration_name"
}

variable "nic_private_ip_address_allocation" {
  default     = "Dynamic"
  type        = string
  description = "Define o nic_private_ip_address_allocation"
}

#tags
variable "source_tag" {
  default     = "terraform"
  type        = string
  description = "Define a tag utilizada"
}

variable "environment_tag" {
  default     = "development"
  type        = string
  description = "Define a tag utilizada"
}







