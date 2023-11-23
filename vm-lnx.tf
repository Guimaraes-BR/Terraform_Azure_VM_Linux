# Ssh key on Azure
data "azurerm_ssh_public_key" "ssh_key_lnx" {
  name                = "linux-key"
  resource_group_name = "rg-ssh-keys"
}


# Create virtual machine linux
resource "azurerm_linux_virtual_machine" "vm_lnx_terraform" {
  name                = var.vm_lnx_name
  resource_group_name = var.resource_group
  location            = var.location
  size                = var.vm_lnx_size
  admin_username      = var.vm_lnx_admin_username
  network_interface_ids = [
    azurerm_network_interface.nic_terraform.id,
  ]

  admin_ssh_key {
    username   = var.vm_lnx_admin_username
    public_key = data.azurerm_ssh_public_key.ssh_key_lnx.public_key
  }

  os_disk {
    caching              = var.vm_lnx_os_disk_caching
    storage_account_type = var.vm_lnx_storage_account_type
  }

  source_image_reference {
    publisher = var.vm_lnx_source_image_reference_publisher
    offer     = var.vm_lnx_source_image_reference_offer
    sku       = var.vm_lnx_source_image_reference_sku
    version   = var.vm_lnx_source_image_reference_version
  }
}

# Create public IPs
resource "azurerm_public_ip" "pip_terraform" {
  name                = var.vm_lnx_pip_name
  resource_group_name = var.resource_group
  location            = var.location
  allocation_method   = var.vm_lnx_pip_allocation_method

  tags = {
    source      = var.source_tag
    environment = var.environment_tag
  }
  depends_on = [
    azurerm_resource_group.rg_terraform
  ]

}