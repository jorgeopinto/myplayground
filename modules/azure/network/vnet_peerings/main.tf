##################################
#       VNET-PEERINGS            #
##################################

# Peering: Hub → Spoke
resource "azurerm_virtual_network_peering" "hub_to_spoke" {
  name                      = "peer-${var.hub_vnet_name}-to-${var.spoke_vnet_name}"
  resource_group_name       = var.hub_resource_group_name
  virtual_network_name      = var.hub_vnet_name
  remote_virtual_network_id = var.spoke_vnet_id

  allow_virtual_network_access = var.HUB-TO-SPOKE-allow_virtual_network_access
  allow_forwarded_traffic      = var.HUB-TO-SPOKE-allow_forwarded_traffic
  allow_gateway_transit        = var.HUB-TO-SPOKE-allow_gateway_transit
  use_remote_gateways = var.HUB-TO-SPOKE-use_remote_gateways

}

# Peering: Spoke → Hub
resource "azurerm_virtual_network_peering" "spoke_to_hub" {
  name                      = "peer-${var.spoke_vnet_name}-to-${var.hub_vnet_name}"
  resource_group_name       = var.spoke_resource_group_name
  virtual_network_name      = var.spoke_vnet_name
  remote_virtual_network_id = var.hub_vnet_id


  allow_virtual_network_access = var.SPOKE-TO-HUB-allow_virtual_network_access
  allow_forwarded_traffic      = var.SPOKE-TO-HUB-allow_forwarded_traffic
  allow_gateway_transit        = var.SPOKE-TO-HUB-allow_gateway_transit
  use_remote_gateways = var.SPOKE-TO-HUB-use_remote_gateways
  
}