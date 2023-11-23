# Create Resource Group
resource "azurerm_resource_group" "rg_terraform" {
  name     = var.resource_group
  location = var.location

  tags = {
    source      = var.source_tag
    environment = var.environment_tag
  }
}

# Create subnet
resource "azurerm_subnet" "sub_terraform" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.vnet_terraform.name
  address_prefixes     = [var.subnet_address_prefixes]
}

# Create network interface
resource "azurerm_network_interface" "nic_terraform" {
  name                = var.name_nic_terraform
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = var.nic_ip_configuration_name
    subnet_id                     = azurerm_subnet.sub_terraform.id
    private_ip_address_allocation = var.nic_private_ip_address_allocation
    public_ip_address_id          = azurerm_public_ip.pip_terraform.id
  }

  tags = {
    source      = var.source_tag
    environment = var.environment_tag
  }
}

# Create virtual network
resource "azurerm_virtual_network" "vnet_terraform" {
  name                = var.vnet_name
  address_space       = [var.vnet_address_space]
  location            = var.location
  resource_group_name = var.resource_group #azurerm_resource_group.rg_terraform.name

  tags = {
    source      = var.source_tag
    environment = var.environment_tag
  }
  depends_on = [
    azurerm_resource_group.rg_terraform
  ]
}