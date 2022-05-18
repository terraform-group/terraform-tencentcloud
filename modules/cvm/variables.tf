variable "instance_name" {
    type = string
  
}

variable "availability_zone" {
    type = string
  
}

variable "image_id" {
    type = string
}

variable "instance_type" {
    type = string
  
}

variable "security_group_id" {
  type = list(string)
}

variable "vpc_id" {
}

variable "subnet_id" {
}