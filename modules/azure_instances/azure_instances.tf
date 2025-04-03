terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.17"
    }
  }
}

# Removed deprecated argument "skip_provider_registration"

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.resource_group_location
  resource_group_name = azurerm_resource_group.rg.name
}
resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
resource "azurerm_network_interface" "nic" {
  name                = "myNic"
  count               = var.azurerm_count
  location            = var.resource_group_location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "myIpConfig"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_linux_virtual_machine" "vm" {
  name = "myVM"
  # Removed invalid attribute "azure_instance_name"
  count                 = var.azurerm_count
  location              = var.resource_group_location
  resource_group_name   = azurerm_resource_group.rg.name
  size                  = "Standard_DS1_v2"
  admin_username        = "adminuser"
  admin_password        = "Password1234"
  network_interface_ids = [azurerm_network_interface.nic[count.index].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  admin_ssh_key {
    username   = "adminuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCrRX1JC3Vh3uqA17SAAVKCQLDmUYEVz2/F3p69B5SlDAucMLMjB8m5t8kmwzVxXVRhEv8p7O2+TnW/jakwFercw2lCuRNpjnJqDx89fxYt9NVEXX0gN/TywiWt3J7612JZmCY0r0ThUUC2i4a/P+A9mTtbxyKnAUQDw8krN2nqIp/sOPf3SuWxmbgPuztVhcJ92ZjUjdEhjmWQZF9SEnbWx5ht2cBtosT1tb24TFMVAfbTsv2DKycqO9jlcltWPYdkReAn1tGa34PzV5uvmxrVWleoweOk7QGvrgFWz2WJcTsB9CIJXfnVgivb+IxG9AL+EedTd3ZoCXuZaDj14UAjKR0XrALyRG1WIBqZUD8rr+yY7PZGXXbY2ra44W2fnprQYJccRQ/zIMdPIqyXw1w8L+dZVf6qpbDk+qcHtM05amooFe+HI3PxpyUD0JsrelO5szCjrmeqMcFcRV3QNjD5Eb4Yqlz1FLQKyLJtHF2jIA/51m1yOE5xq+J6AahGm16XQ6M/0IyFCLWb049aav2dWCNnKcR5jqmDiuR+q2zQX6mp8P9y//VC0none5pe10vtBXwhw22/EKwDwkR4ZTBTFEFQYoVMx9dfRR9xLZCx5X4b6qpTBtj2UC4yD0j054D76l3KJzpd/gaxHEZNoQwjCCqZ4sbPWgJ3VLQlqu36ew=="
  }
}