#storage/recource group variables#
resource_group_name = "VM-resources"
subscription_id = "c998da0a-2c4e-4e5f-9741-24a6aa81b169"
storage_account_name = "tayanabstorage"
account_tier_type = "Standard"
Account_rep_type = "LRS"

#networking variavles#
private_ip_address_allocation = "Dynamic"

#VM variables#
size = "Standard_B1ls"

caching = "ReadWrite"
storage_account_type = "Standard_LRS"

publisher = "MicrosoftWindowsServer"
offer = "WindowsServer"
sku = "2016-Datacenter"

