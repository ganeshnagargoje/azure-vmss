resource "azurerm_lb" "lb" {
  name                = var.lb_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = var.lb_frontend_ip_name
    public_ip_address_id = azurerm_public_ip.lb_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name            = var.lb_backend_pool_name
  loadbalancer_id = azurerm_lb.lb.id
}

resource "azurerm_lb_probe" "lb_probe_http" {
  name                 = var.lb_probe_http_name
  loadbalancer_id      = azurerm_lb.lb.id
  protocol             = "Http"
  port                 = 80
  interval_in_seconds  = 15
  number_of_probes     = 2
  request_path         = "/"
}

resource "azurerm_lb_rule" "lb_rule_http" {
  name                           = var.lb_rule_http_name
  loadbalancer_id                = azurerm_lb.lb.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = azurerm_lb.lb.frontend_ip_configuration[0].name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_pool.id]
  probe_id                       = azurerm_lb_probe.lb_probe_http.id
}
