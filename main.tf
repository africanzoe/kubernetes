resource "azurerm_subnet_route_table_association" "vnet" {
  subnet_id      = local.azurerm_subnets[each.key]
  route_table_id = each.value
  for_each       = var.route_tables_ids
}

resource "azurerm_virtual_network" "vnet" {
  resource_group_name = data.azurerm_resource_group.vnet.name
  name                = var.vnet_name
  location            = var.vnet_location != null ? var.vnet_location : data.azurerm_resource_group.vnet.location

  address_space = [
    var.address_space,
  ]

  dns_servers = [
    var.dns_servers,
  ]
}

resource "azurerm_subnet" "subnet" {
  virtual_network_name                           = azurerm_virtual_network.vnet.name
  service_endpoints                              = lookup(var.subnet_service_endpoints, var.subnet_names[count.index], null)
  resource_group_name                            = data.azurerm_resource_group.vnet.name
  name                                           = var.subnet_names[count.index]
  enforce_private_link_service_network_policies  = lookup(var.subnet_enforce_private_link_service_network_policies, var.subnet_names[count.index], false)
  enforce_private_link_endpoint_network_policies = lookup(var.subnet_enforce_private_link_endpoint_network_policies, var.subnet_names[count.index], false)
  count                                          = length(var.subnet_names)

  address_prefixes = [
    var.subnet_prefixes[count.index],
  ]

  dynamic {
    delegation {
      for_each = lookup(var.subnet_delegation, var.subnet_names[count.index], {})
      content {
        name = "delegation.key"
        service_delegation {
          name    = lookup(delegation.value, "service_name")
          actions = lookup(delegation.value, "service_actions", [])
        }
      }
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "vnet" {
  subnet_id                 = local.azurerm_subnets[each.key]
  network_security_group_id = each.value
  for_each                  = var.nsg_ids
}

data "azurerm_resource_group" "vnet" {
  name = var.resource_group_name
}

