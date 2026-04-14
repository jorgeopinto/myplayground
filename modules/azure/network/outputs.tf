output "vnet_id" {
 value = azurerm_virtual_network.qdg-HUB-WE.id 
}

output "subnet_id" {
    value = azurerm_subnet.qdg-HUB-WE[*].id  
}
