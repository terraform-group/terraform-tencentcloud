variable "vpc_name" {
    type = string
    default = "vpc"
    sensitive = true
}

variable "vpc_cidr_block" {
    type = string
    sensitive = true  
}

# variable "vpc_dns_servers" {
#     type = list(string)
#     default = ["119.29.29.29", "8.8.8.8"]
#     sensitive = true
# }

variable "env_name" {
    type = string
}

variable "subnet_cidr_block" {
    type = string
  
}

variable "subnet_name" {
    type = string
  
}
variable "availability_zone" {
    type = string
  
}