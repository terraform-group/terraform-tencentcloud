terraform {
  backend "cos" {
    region = "ap-beijing"
    bucket = "tfbackend-1252396688"
    prefix = "env/dev/network"
  }
}