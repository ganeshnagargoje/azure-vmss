resource "azurerm_public_ip" "nat_gw_ip" {
  name                = var.nat_gw_ip_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = ["1"]
}

resource "azurerm_nat_gateway" "nat_gateway" {
  name                    = var.nat_gateway_name
  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  sku_name                = "Standard"
  idle_timeout_in_minutes = 10
  zones                   = ["1"]
}

resource "azurerm_subnet_nat_gateway_association" "nat_gateway_association" {
  subnet_id      = azurerm_subnet.subnet.id
  nat_gateway_id = azurerm_nat_gateway.nat_gateway.id
}

resource "azurerm_nat_gateway_public_ip_association" "nat_gateway_public_ip_association" {
  public_ip_address_id = azurerm_public_ip.nat_gw_ip.id
  nat_gateway_id       = azurerm_nat_gateway.nat_gateway.id
}
