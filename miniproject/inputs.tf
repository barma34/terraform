# variable "my_rg" {
#   type = object({
#     name     = string
#     location = string
#   })
#   default = {
#     name     = "my_rg"
#     location = "eastus"
#   }
# }
# variable "my_vn" {
#   type        = list(string)
#   description = "This is primary networks cidr range"
#   default     = ["192.168.0.0/16"]
# }

# variable "subnet_names" {
#   type        = list(string)
#   description = "this is a web subnets"
#   default     = ["web ", "db"]
# }
# variable "subnet_cidrs" {
#   type        = list(string)
#   description = "this is a cidr"
#   default     = ["192.168.1.0/24", "192.168.2.0/24"]
# }

variable "web_nsg_rules" {
  type = list(object({
    name                       = string
    description                = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
    access                     = string
    priority                   = number
  }))
  description = "web nsg rules"
  default = [{
    name                       = "openhttp"
    description                = "this opens 80 port"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    access                     = "Allow"
    priority                   = 1000
  }]
}
# variable "preshcool" {
#   type = object({
#     name                    = string
#     size                    = string
#     resource_group_name     = string
#     location                = string
#     publisher       = string
#     suk                     = string
#     network_profile         = string
#     storage_profile_os_disk = string
#     upgrade_policy_mode     = string
#     virsion =string
#   })
#   default = {
#     name = "preshcool"
#     size = "Standard_B1s"
#     resource_group_name = "my_rg"
#     location = "eastus"
#     publisher       = "canonical"
#     suk = "22_04-lts-gen2"
#     network_profile = ""
#     storage_profile_os_disk = ""
#     upgrade_policy_mode = ""
#     version         = "latest"


    