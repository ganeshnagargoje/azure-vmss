resource "azurerm_lb_nat_rule" "lb_nat_rule_ssh" {
  name                            = var.lb_nat_rule_ssh_name
  resource_group_name             = azurerm_resource_group.rg.name
  loadbalancer_id                 = azurerm_lb.lb.id
  protocol                        = "Tcp"
  frontend_port_start             = 50000
  frontend_port_end               = 50119
  backend_port                    = 22
  frontend_ip_configuration_name  = azurerm_lb.lb.frontend_ip_configuration[0].name
  backend_address_pool_id         = azurerm_lb_backend_address_pool.backend_pool.id
}
