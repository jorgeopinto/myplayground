

# Linux Machine: 
resource "azurerm_public_ip" "PublicIP-to-linux1" {
  name                = "PublicIP-to-linux1"
  resource_group_name = azurerm_resource_group.quinta-do-gato.name
  location            = var.WE
  allocation_method   = "Static"

  tags = local.common_tags
}

resource "azurerm_network_interface" "LinuxNIC-1" {
  name                = "LinuxNIC-1"
  location            = var.WE
  resource_group_name = azurerm_resource_group.quinta-do-gato.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.acess_to_linux_we.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.PublicIP-to-linux1.id
  }

  tags = local.common_tags
}

resource "azurerm_linux_virtual_machine" "Linux1" {
  name                = "Linux1"
  resource_group_name = azurerm_resource_group.quinta-do-gato.name
  location            = var.WE
  size                = "Standard_D2s_v3"
  admin_username      = "jorge"
  network_interface_ids = [
    azurerm_network_interface.LinuxNIC-1.id,
  ]

  admin_ssh_key {
    username   = "jorge"
    public_key = var.azure_key_pub
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  tags = local.common_tags

}