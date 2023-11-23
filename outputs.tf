output "resource_group" {
  value = var.resource_group
}

output "vnet-name" {
  value = var.vnet_name
}

output "vnet_address_space" {
  value = var.vnet_address_space
}

output "vnet_location" {
  value = var.location
}

output "vnet_subnet" {
  value = var.subnet_address_prefixes
}

output "vm_lnx_name" {
  value = var.vm_lnx_name
}

output "vm_lnx_size" {
  value = var.vm_lnx_size
}

output "vm_lnx_public_ip" {
  value = azurerm_public_ip.pip_terraform.ip_address
}

