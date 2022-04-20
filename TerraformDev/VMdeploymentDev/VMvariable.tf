
#storage/recource group variables#
variable "resource_group_name"{}
variable "subscription_id" {}  
variable "storage_account_name" {  

}
variable "account_tier_type" {}
variable "Account_rep_type" {}

#networking variables#
variable "private_ip_address_allocation" {}
variable "public_ip_name" {}
#VM variables#
variable "size" {}

variable "caching" {}
variable "storage_account_type" {}

variable "publisher" {}
variable "offer"    {}
variable "sku"      {}

variable "VMname" {}



#VM login#
variable "admin_username" {
    description = "VM admin username"
    type = string
    sensitive = true
}

variable "admin_password" {
    description = "VM admin password"
    type = string
    sensitive = true
}
