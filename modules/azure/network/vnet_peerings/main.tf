##################################
#       VNET-PEERINGS            #
##################################

# Peering: Hub → Spoke
resource "azurerm_virtual_network_peering" "hub_to_spoke" {
  name                      = "peer-${var.hub_vnet_name}-to-${var.spoke_vnet_name}"
  resource_group_name       = var.hub_resource_group_name
  virtual_network_name      = var.hub_vnet_name
  remote_virtual_network_id = var.spoke_vnet_id

  allow_virtual_network_access = var.hub_to_spoke_allow_virtual_network_access
  allow_forwarded_traffic      = var.hub_to_spoke_allow_forwarded_traffic
  allow_gateway_transit        = var.hub_to_spoke_allow_gateway_transit
  use_remote_gateways = var.hub_to_spoke_use_remote_gateways

}

# Peering: Spoke → Hub
resource "azurerm_virtual_network_peering" "spoke_to_hub" {
  name                      = "peer-${var.spoke_vnet_name}-to-${var.hub_vnet_name}"
  resource_group_name       = var.spoke_resource_group_name
  virtual_network_name      = var.spoke_vnet_name
  remote_virtual_network_id = var.hub_vnet_id


  allow_virtual_network_access = var.spoke_to_hub_allow_virtual_network_access
  allow_forwarded_traffic      = var.spoke_to_hub_allow_forwarded_traffic
  allow_gateway_transit        = var.spoke_to_hub_allow_gateway_transit
  use_remote_gateways = var.spoke_to_hub_use_remote_gateways
  
}