variable "primary_region" {
  type    = string
  default = "ap-south-1"
}

variable "key_name" {
  type    = string
  default = "node.pem"
}

variable "security_group_name" {
  type    = string
  default = "openall"
}

variable "az" {
  type    = string
  default = "ap-south-1a"
}

variable "instance_size" {
  type    = string
  default = "t2.micro"
}

variable "key_path" {
  type    = string
  default = "c:/users/wi.10"

}

variable "build_id" {
  type    = string
  default = "1"

}

