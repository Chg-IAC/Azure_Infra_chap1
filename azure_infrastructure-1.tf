provider "azurerm" {
    version = "~>2"
    features{}
    subscription_id = "${var.subscription_id}"
    client_id       = "${var.client_id}"
    client_secret   = "${var.client_secret}"
    tenant_id       = "${var.tenant}"
}
# creation du groupe de ressource RGMonoVM
resource "azurerm_resource_group" "RGMonoVM"{
    name = "${var.resource_group}"
    location = "${var.location}"
}
# Create a virtual network within the resource group
resource "azurerm_virtual_network" "network1" {
  name                = "vnet1"
  resource_group_name = "${var.resource_group}"
  location            = "${var.location}"
  address_space       = ["192.168.0.0/16"]
}
resource "azurerm_subnet" "subnet1" {
  name                 = "sub1"
  resource_group_name  = "${var.resource_group}"
  virtual_network_name = azurerm_virtual_network.network1.name
  address_prefix       = "192.168.1.0/24"
}
resource "azurerm_public_ip" "ip_floating_Vmaz" {
  name                    = "ip_floating_Vmaz"
  location                = "${var.location}"
  resource_group_name     = "${var.resource_group}"
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30

  tags = {
    environment = "test"
  }
}
resource "azurerm_network_interface" "vmaz_net" {
  name                = "VMAZ_net"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.ip_floating_Vmaz.id
  }
}
#for (i = 0; i < 3; i++) {

resource "azurerm_windows_virtual_machine" "vmaz" {
  
  name                = "vmaz"
  resource_group_name = "${var.resource_group}"
  location            = "${var.location}"
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.vmaz_net.id,
  ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
