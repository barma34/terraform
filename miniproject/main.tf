resource "azurerm_resource_group" "my_rg" {
  name     = "my_rg"
  location = "eastus"
  tags = {
    Environmental = "Dev"
    createdBy     = "Terraform"
  }
}

resource "azurerm_virtual_network" "network" {
  name                = "network"
  resource_group_name = "my_rg"
  location            = "eastus"
  address_space       = ["192.168.0.0/16"]
  tags = {
    Environmental = "Dev"
    createdBy     = " terraform"
  }
  depends_on = [azurerm_resource_group.my_rg]
}
resource "azurerm_subnet" "web" {
  name                 = "web"
  resource_group_name  = "my_rg"
  virtual_network_name = "network"
  address_prefixes     = ["192.168.1.0/24"]
  depends_on           = [azurerm_virtual_network.network]
}
resource "azurerm_subnet" "db" {
  name                 = "db"
  resource_group_name  = "my_rg"
  virtual_network_name = "network"
  address_prefixes     = ["192.168.2.0/24"]
  depends_on           = [azurerm_virtual_network.network]
}
# Create network security group
resource "azurerm_network_security_group" "my_sg" {
  name                = "my_sg"
  location            = "eastus"
  resource_group_name = "my_rg"
  tags = {
    Environmental = "Dev"
    createdBy     = "Terraform"
  }
  depends_on = [azurerm_resource_group.my_rg]
}

resource "azurerm_network_security_rule" "my_sg" {
  count                       = length(var.web_nsg_rules)
  name                        = var.web_nsg_rules[count.index].name
  resource_group_name         = "my_rg"
  network_security_group_name = "my_sg"
  description                 = var.web_nsg_rules[count.index].description
  protocol                    = var.web_nsg_rules[count.index].protocol
  source_port_range           = var.web_nsg_rules[count.index].source_port_range
  destination_port_range      = var.web_nsg_rules[count.index].destination_port_range
  source_address_prefix       = var.web_nsg_rules[count.index].source_address_prefix
  destination_address_prefix  = var.web_nsg_rules[count.index].destination_address_prefix
  access                      = var.web_nsg_rules[count.index].access
  priority                    = var.web_nsg_rules[count.index].priority
  direction                   = "Inbound"
  depends_on = [
    azurerm_resource_group.my_rg,
    azurerm_network_security_group.my_sg
  ]
}