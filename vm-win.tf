resource "azurerm_windows_virtual_machine" "vm_terraform" {
  name                = "terraform-win"
  resource_group_name = azurerm_resource_group.rg_terraform.name
  location            = azurerm_resource_group.rg_terraform.location
  size                = "Standard_B2s"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.nic_terraform.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  tags = {
    source      = var.source_tag
    environment = var.environment_tag
  }
}

resource "azurerm_public_ip" "pip_terraform" {
  name                = "pip_terraform"
  resource_group_name = azurerm_resource_group.rg_terraform.name
  location            = azurerm_resource_group.rg_terraform.location
  allocation_method   = "Static"

  tags = {
    source      = var.source_tag
    environment = var.environment_tag
  }
}