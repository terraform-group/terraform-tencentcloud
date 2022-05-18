locals {
  vpc_name          = "dev-vpc"
  vpc_cidr_block    = "172.16.0.0/12"
  env_name          = "dev"
  subnet_cidr_block = "172.16.0.0/21"
  availability_zone = "ap-beijing-2"
  subnet_name       = "dev-subnet"
}

module "dev-vpc" {
  source            = "../../../modules/vpc"
  vpc_name          = local.vpc_name
  vpc_cidr_block    = local.vpc_cidr_block
  env_name          = local.env_name
  subnet_name       = local.subnet_name
  availability_zone = local.availability_zone
  subnet_cidr_block = local.subnet_cidr_block
}