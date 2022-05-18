provider "tencentcloud" {
  region = var.region
}

data "terraform_remote_state" "network-data" {
  backend = "cos"

  config = {
    region = "ap-beijing"
    bucket = "tfbackend-1252396688"
    prefix = "env/dev/network"
  }
}