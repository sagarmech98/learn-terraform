provider "azurerm" {
  features {}
  subscription_id = "72129bc2-1be7-4c6e-971e-9375ebd6c232"
}

resource "azurerm_virtual_machine" "test" {
  name                  = "test-vm"
  location              = "UK west"
  resource_group_name   = "Project"
  network_interface_ids = ["/subscriptions/72129bc2-1be7-4c6e-971e-9375ebd6c232/resourceGroups/Project/providers/Microsoft.Network/networkInterfaces/terrafrom-testing"]
  vm_size               = "Standard_B2als_v2"
  

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/72129bc2-1be7-4c6e-971e-9375ebd6c232/resourceGroups/Project/providers/Microsoft.Compute/images/devops-practice-image"
  }
  storage_os_disk {
    name              = "test-vm-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "test-vm"
    admin_username = "testing"
    admin_password = "Password@1234"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}
  