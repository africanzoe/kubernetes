resource "azurerm_resource_group" "resource-group_2" {
  name     = "rg"
  location = "East US"

  tags = {
    env      = "Azure"
    archUUID = "33872a58-7e34-4856-8742-86c433fa68f5"
  }
}

resource "azurerm_virtual_network" "virtual_network_3" {
  tags                = merge(var.tags)
  resource_group_name = azurerm_resource_group.resource-group_2.name
  name                = "vnet1"
  location            = "East US"

  address_space = [
    "10.0.0.0/16",
  ]
}

resource "azurerm_subnet" "subnet_4" {
  virtual_network_name = azurerm_virtual_network.virtual_network_3.name
  resource_group_name  = azurerm_resource_group.resource-group_2.name
  name                 = "subnet1"

  address_prefixes = [
    "10.0.1.0/24",
  ]
}

resource "azurerm_network_security_group" "network_security_group_5" {
  resource_group_name = azurerm_resource_group.resource-group_2.name
  location            = "East US"

  tags = {
    env      = "Azure"
    archUUID = "33872a58-7e34-4856-8742-86c433fa68f5"
  }
}

